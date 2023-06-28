import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

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
  String _result = '';
  bool logoutVisible = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    HashMap themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    redirectUrl = Uri.parse(
        'myapp://com.example.floxy_pay/auth');

    await Web3AuthFlutter.init(Web3AuthOptions(
        clientId:
        'BEKnO5WgGdCOoGZIIxr3ThNLoXwHaewcYc4PBh46Q2M8s3Jm4IivcxUFBIhoNYRrltyJQ_2iUAUZCwWLFj4yFKQ',
        network: Network.testnet,
        redirectUrl: redirectUrl,
        whiteLabel: WhiteLabelData(
            dark: true, name: "Floxy App", theme: themeMap)));

    await Web3AuthFlutter.initialize();

    final String res = await Web3AuthFlutter.getPrivKey();
    print(res);
    if (res.isNotEmpty) {
      setState(() {
        logoutVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Floxy Pay'),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Visibility(
                    visible: !logoutVisible,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Web3Auth',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Color(0xFF0364ff)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Login with',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () => _login(_withGoogle)(),
                            child: const Text('Google')
                        ),
                        ElevatedButton(
                            onPressed: () => _login(_withFacebook)(),
                            child: const Text('Facebook')
                        ),

                        // ElevatedButton(
                        //     onPressed: _login(_withEmailPasswordless),
                        //     child: const Text('Email Passwordless')),
                        // ElevatedButton(
                        //     onPressed: _login(_withDiscord),
                        //     child: const Text('Discord')),
                      ],
                    ),
                  ),
                  Visibility(
                    // ignore: sort_child_properties_last
                    child: Column(
                      children: [
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.red[600] // This is what you need!
                              ),
                              onPressed: _logout(),
                              child: Column(
                                children: const [
                                  Text('Logout'),
                                ],
                              )),
                        ),
                        ElevatedButton(
                            onPressed: _privKey(_getPrivKey),
                            child: const Text('Get PrivKey')),
                        ElevatedButton(
                            onPressed: _userInfo(_getUserInfo),
                            child: const Text('Get UserInfo')),
                      ],
                    ),
                    visible: logoutVisible,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_result),
                  )
                ],
              )),
        ),
      ),
    );
  }

  VoidCallback _login(Future<Web3AuthResponse> Function() method) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        setState(() {
          logoutVisible = true;
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _logout() {
    return () async {
      try {
        await Web3AuthFlutter.logout();
        setState(() {
          _result = '';
          logoutVisible = false;
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _privKey(Future<String?> Function() method) {
    return () async {
      try {
        final String? response = await Web3AuthFlutter.getPrivKey();
        setState(() {
          _result = response!;
          logoutVisible = true;
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _userInfo(Future<TorusUserInfo> Function() method) {
    return () async {
      try {
        final TorusUserInfo response = await Web3AuthFlutter.getUserInfo();
        setState(() {
          _result = response.toString();
          logoutVisible = true;
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
      mfaLevel: MFALevel.NONE,
    ));
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.facebook));
  }

  Future<Web3AuthResponse> _withEmailPasswordless() {
    return Web3AuthFlutter.login(LoginParams(
        loginProvider: Provider.email_passwordless,
        extraLoginOptions: ExtraLoginOptions(login_hint: "")));
  }

  Future<Web3AuthResponse> _withDiscord() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.discord));
  }

  Future<String?> _getPrivKey() {
    return Web3AuthFlutter.getPrivKey();
  }

  Future<TorusUserInfo> _getUserInfo() {
    return Web3AuthFlutter.getUserInfo();
  }
}
