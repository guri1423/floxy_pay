
import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class PolyHandler {
  PolyHandler._();

  static final PolyHandler _instance = PolyHandler._();

  factory PolyHandler() => _instance;

  late Client httpClient1;
  late Web3Client ethereumClient1;

  dynamic mainNetBalance = 0;


  StorageServices _storageServices = StorageServices();

  /*String address1 = '0xdAC17F958D2ee523a2206206994597C13D831ec7';*/

  String ethereumClientUrl1 =
      'https://polygon-rpc.com';
  String contractName1 = "TokenWrapped";


  Future<List<dynamic>> query1(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract1();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethereumClient1.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> transaction1(String functionName, List<dynamic> args) async {
    String? private_key1 = await _storageServices.getId();
    EthPrivateKey credential = EthPrivateKey.fromHex(private_key1!);
    DeployedContract contract = await getContract1();
    ContractFunction function = contract.function(functionName);
    dynamic result = await ethereumClient1.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<DeployedContract> getContract1() async {
    String abi = await rootBundle.loadString("assets/polygon_eth.json");

    String contractAddress = "0xc2132d05d31c914a87c6611c10748aeb04b58e8f";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName1),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<String> getBalance1() async {
    httpClient1 = Client();
    ethereumClient1 = Web3Client(ethereumClientUrl1, httpClient1);

    debugPrint('****** get balance 1');

    // String walletAddress = "0xd7aa9ba6caac7b0436c91396f22ca5a7f31664fc";

    String? walletAddress = await _storageServices.getAddress();

    debugPrint(walletAddress.toString());

    List<dynamic> result =
    await query1('balanceOf', [EthereumAddress.fromHex(walletAddress!)]);

    debugPrint(result.toString());

    return result[0].toString();

    // mainNetBalance = int.parse(result[0].toString());

  }


  Future<void> transferTokens(String recipientAddress, double amount) async {
    final client = Web3Client('https://zkevm-rpc.com/', Client());

    String? private_key1 = await _storageServices.getId();

    // Load your wallet and account credentials
    final credentials = await client.credentialsFromPrivateKey(private_key1!);
    final ownAddress = await credentials.extractAddress();

    debugPrint('Owner Address: ${ownAddress}');

    // Load the token contract ABI
    String abi = await rootBundle.loadString("assets/etherScan_myToken.json");

    // Define the contract address
    String contractAddress = "0x1E4a5963aBFD975d8c9021ce480b42188849D41d";

    // Create a DeployedContract instance
    final tokenContract = DeployedContract(ContractAbi.fromJson(abi, 'TokenWrapped'), EthereumAddress.fromHex(contractAddress),);

    // Convert the amount to Wei
    final decimalPlaces = 18;
    final amountInWei = (amount * (10 * decimalPlaces));

    debugPrint('Amount in Wei ${amountInWei}');

    // Execute the transfer
    final transferFunction = tokenContract.function('transfer');
    final txHash = await client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: tokenContract,
        function: transferFunction,
        parameters: [EthereumAddress.fromHex(recipientAddress), BigInt.from(amountInWei)],
      ),
      chainId: 137,
    );

    // Wait for transaction confirmation
    TransactionReceipt? receipt;
    do {
      await Future.delayed(Duration(seconds: 5));
      receipt = await client.getTransactionReceipt(txHash);
      debugPrint('Transaction pending...');
    } while (receipt == null);

    if (receipt.status!) {
      // Transaction was successful
      debugPrint('Transaction successful! Receipt: ${receipt.toString()}');
      // Access other fields in the receipt
      debugPrint('Block number: ${receipt.blockNumber}');
      debugPrint('Gas used: ${receipt.gasUsed}');
      // ...
    } else {
      // Transaction failed
      debugPrint('Transaction failed! Receipt: ${receipt.toString()}');
    }
  }
}
