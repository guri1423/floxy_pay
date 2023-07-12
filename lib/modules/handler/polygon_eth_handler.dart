import 'dart:ffi';

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

  /*String address1 = '0xdAC17F958D2ee523a2206206994597C13D831ec7';*/

  String ethereumClientUrl1 =
      'https://zkevm-rpc.com/';
  String contractName1 = "TokenWrapped";
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
    String abi = await rootBundle.loadString("assets/polygon_eth.json");

    String contractAddress = "0x1E4a5963aBFD975d8c9021ce480b42188849D41d";

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

    String walletAddress = "0xd7aa9ba6caac7b0436c91396f22ca5a7f31664fc";

    List<dynamic> result =
    await query1('balanceOf', [EthereumAddress.fromHex(walletAddress)]);

    debugPrint(result.toString());

    return result[0].toString();

    // mainNetBalance = int.parse(result[0].toString());

  }
}
