
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Center(
        child: Container(
            height: 40,
            width: 80,
            child: ElevatedButton(onPressed: () async {
              final Web3AuthResponse response = await Web3AuthFlutter.login(
                  LoginParams(loginProvider: Provider.google)
              );
            }, child: const Center(child: Text('Login')),)),
      ),
    );
  }


}
