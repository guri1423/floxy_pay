
import 'package:floxy_pay/modules/login/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Uri redirectUrl = Uri.parse('$customScheme://$appPackageName');

    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId: "BOwKH4qComUlyv2Xxh8O--cwq5DMn-BrN4oeCQO9XNPQz16rn2pkPX8DOEWFENvWKMcepJFg7V2Ug0N3ZFj9KpE",
      network: Network.testnet,
      redirectUrl: redirectUrl,
    ));
  }

  static const String customScheme = 'myapp';
  static const String appPackageName = 'com.example.floxy_pay';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


