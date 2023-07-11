import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class BalanceHandler {
  BalanceHandler._();

  static final BalanceHandler _instance = BalanceHandler._();

  factory BalanceHandler() => _instance;

  final ethClient = Web3Client('https://rpc-mumbai.matic.today', Client());

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString('assets/ethereum.abi.json');
    String contractAddress = '0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB';
    final contract = DeployedContract(ContractAbi.fromJson(abi, 'MyToken'),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<DeployedContract> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("assets/ethereum.abi.json");
    var jsonAbi = jsonDecode(abiStringFile);
    String contractAddress = '0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB';
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonAbi, 'MyToken'),
      EthereumAddress.fromHex(contractAddress),
    );
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();

    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(
        contract: contract,
        function: ethFunction,
        params: [
          EthereumAddress.fromHex('0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6')
        ]);

    return result;
  }

  Future<List> getWalletBalance(dynamic targetAddress) async {
    List<dynamic> result = await query('balanceOf', [
      EthereumAddress.fromHex('0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6')
    ]);

    debugPrint(result.toString());

    return result;
  }
}
