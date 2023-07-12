import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class BalanceHandler {
  BalanceHandler._();

  static final BalanceHandler _instance = BalanceHandler._();

  factory BalanceHandler() => _instance;

  late Client httpClient1;
  late Web3Client ethereumClient1;

  dynamic mainNetBalance = 0;



  String address1 = '0xdAC17F958D2ee523a2206206994597C13D831ec7';
  String ethereumClientUrl1 =
      'https://mainnet.infura.io/v3/4cf5ea966d084aceb3c25b05c7a0089e';
  String contractName1 = "TetherToken";
  String private_key1 = "";


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
    String abi = await rootBundle.loadString("assets/tether_token.abi.json");

    String contractAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName1),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<dynamic> getBalance1() async {

    httpClient1 = Client();
    ethereumClient1 = Web3Client(ethereumClientUrl1, httpClient1);

    debugPrint('****** get balance 1');

    String walletAddress = "0x510a23606050b6bA1Ae37BdACb4e221756E31533";

    List<dynamic> result = await query1('balanceOf', [EthereumAddress.fromHex(walletAddress)]);

    debugPrint(result.toString());

    mainNetBalance = int.parse(result[0].toString());

    return mainNetBalance;

  }



  }
