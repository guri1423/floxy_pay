

import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class SendBalanceHandler {
  SendBalanceHandler._();

  static final SendBalanceHandler _instance = SendBalanceHandler._();

  factory SendBalanceHandler() => _instance;

  late Client httpClient1;
  late Web3Client ethereumClient1;

  dynamic mainNetBalance = 0;

  String ethereumClientUrl1 =
      'https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c';
  String contractName1 = "MyToken";
  String private_key1 = "f86b4ac862171a594c255fadcfc6e20a7d1a6faba39a6756d1927a28d3c43023";

  StorageServices _storageServices = StorageServices();

  Future<List<dynamic>> query1(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract1();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethereumClient1.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> transaction1(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(private_key1);
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

    String abi = await rootBundle.loadString("assets/etherScan_myToken.json");

    String contractAddress = "0x66b78E8D366b54288f70B3074113e53eaCB81992";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName1),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<String> getBalance1() async {
    httpClient1 = Client();
    ethereumClient1 = Web3Client(ethereumClientUrl1, httpClient1);

    String? walletAddress = await _storageServices.getAddress();

    // String walletAddress = "0x6622D772c84fB30B1F1f3a5569cA02D8f12f2d29";

    List<dynamic> result =
    await query1('balanceOf', [EthereumAddress.fromHex(walletAddress!)]);

    debugPrint(result.toString());

    // mainNetBalance = int.parse(result[0].toString());

    return result[0].toString();
  }


  /*Future<String> getBalanceNewMethod() async {
    httpClient1 = Client();
    ethereumClient1 = Web3Client(ethereumClientUrl1, httpClient1);

    String? walletAddress = await _storageServices.getAddress();



    // String walletAddress = "0x6622D772c84fB30B1F1f3a5569cA02D8f12f2d29";

    List<dynamic> result =
    await query1('balanceOf', [EthereumAddress.fromHex(walletAddress!)]);

    debugPrint(result.toString());

    // mainNetBalance = int.parse(result[0].toString());

    return result[0].toString();
  }*/


  Future<void> transferTokens(String recipientAddress, double amount) async {
    final client = Web3Client('https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c', Client());

    // Load your wallet and account credentials
    final credentials = await client.credentialsFromPrivateKey('f86b4ac862171a594c255fadcfc6e20a7d1a6faba39a6756d1927a28d3c43023');
    final ownAddress = await credentials.extractAddress();

    debugPrint('Owner Address: ${ownAddress}');

    // Load the token contract ABI
    String abi = await rootBundle.loadString("assets/etherScan_myToken.json");

    // Define the contract address
    String contractAddress = "0x66b78E8D366b54288f70B3074113e53eaCB81992";

    // Create a DeployedContract instance
    final tokenContract = DeployedContract(ContractAbi.fromJson(abi, 'MyToken'), EthereumAddress.fromHex(contractAddress),);

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
      chainId: 11155111,
    );

    // Wait for transaction confirmation
    TransactionReceipt? receipt;
    do {
      await Future.delayed(Duration(seconds: 5));
      receipt = await client.getTransactionReceipt(txHash);
      debugPrint('Transaction pending...');
    } while (receipt == null);

    Fluttertoast.showToast(
      msg: 'Status of Transaction: ${receipt.status.toString()}',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );

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


  Future<BigInt> estimateGasCost(String recipientAddress, double amount) async {
    final client = Web3Client('https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c', Client());

    final credentials = await client.credentialsFromPrivateKey('f86b4ac862171a594c255fadcfc6e20a7d1a6faba39a6756d1927a28d3c43023');
    final ownAddress = await credentials.extractAddress();

    // Define the transaction parameters
    final fromAddress = ownAddress;
    final toAddress = EthereumAddress.fromHex(recipientAddress);
    final value = EtherAmount.fromUnitAndValue(EtherUnit.ether, amount);

    // Get the gas price
    final gasPrice = await client.getGasPrice();

    // Estimate the gas limit
    final gasLimit = await client.estimateGas(
      sender: fromAddress,
      to: toAddress,
      value: value,
    );

    // Calculate the gas cost
    final gasCost = gasPrice.getInWei;

    debugPrint('Gas cost: $gasCost');

    // Return the gas cost as a BigInt
    return gasCost;
  }


}
