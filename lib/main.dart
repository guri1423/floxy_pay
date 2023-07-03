import 'dart:collection';
import 'package:floxy_pay/core/theme.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

import 'package:web3auth_flutter/web3auth_flutter.dart';

import 'core/colors.dart';
import 'modules/bottom_navigation/bloc/bottom_navigation_cubit.dart';

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
    HashMap<String, String> themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    redirectUrl = Uri.parse('myapp://com.example.floxy_pay/auth');

    await Web3AuthFlutter.init(
      Web3AuthOptions(
        clientId: 'BEKnO5WgGdCOoGZIIxr3ThNLoXwHaewcYc4PBh46Q2M8s3Jm4IivcxUFBIhoNYRrltyJQ_2iUAUZCwWLFj4yFKQ',
        network: Network.testnet,
        redirectUrl: redirectUrl,
        whiteLabel: WhiteLabelData(
          dark: true,
          name: "Floxy App",
          theme: themeMap,
        ),
      ),
    );

    await Web3AuthFlutter.initialize();

    final String? res = await Web3AuthFlutter.getPrivKey();
    if (res != null && res.isNotEmpty) {
      setState(() {
        logoutVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (_) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
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
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => _login(_withGoogle)(),
                              child: const Text('Google'),
                            ),

                            ElevatedButton(
                              onPressed: () => _login(_withFacebook)(),
                              child: const Text('Facebook'),
                            ),

                            ElevatedButton(
                              onPressed: () => _login(_withTwitter)(),
                              child: const Text('Twitter'),
                            ),

                            ElevatedButton(
                              onPressed: () => _login(_withApple)(),
                              child: const Text('Apple'),
                            ),



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
                                  backgroundColor: Colors.red[600]!,
                                ),
                                onPressed: _logout(),
                                child: const Text('Logout'),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _privKey(_getPrivKey),
                              child: const Text('Get PrivKey'),
                            ),
                            ElevatedButton(
                              onPressed: _userInfo(_getUserInfo),
                              child: const Text('Get UserInfo'),
                            ),

                            ElevatedButton(
                              onPressed: (){

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => OnboardingPageOne()),
                                );
                              },
                              child: const Text('Proceed to App'),
                            ),

                          ],
                        ),
                        visible: logoutVisible,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_result),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        theme: CustomThemes.getTheme(),
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
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.facebook,
    ));
  }

  Future<Web3AuthResponse> _withTwitter() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.twitter,
    ));
  }

  Future<Web3AuthResponse> _withApple() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.apple,
    ));
  }

  Future<Web3AuthResponse> _withEmailPasswordless() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.email_passwordless,
      extraLoginOptions: ExtraLoginOptions(login_hint: ""),
    ));
  }

  Future<Web3AuthResponse> _withDiscord() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.discord,
    ));
  }

  Future<String?> _getPrivKey() {
    return Web3AuthFlutter.getPrivKey();
  }


  Future<TorusUserInfo> _getUserInfo() {
    return Web3AuthFlutter.getUserInfo();
  }
}
