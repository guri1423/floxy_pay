import 'dart:collection';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';


class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {



  String _result = '';
  bool logoutVisible = false;
  String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

  Future<void> initPlatformState1() async {
    final themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    redirectUrl = Uri.parse('myapp://com.example.floxy_pay/auth');

    // final loginConfig = HashMap<String, LoginConfigItem>();
    // loginConfig['jwt'] = LoginConfigItem(
    //     verifier: "web3auth-auth0-demo", // get it from web3auth dashboard
    //     typeOfLogin: TypeOfLogin.jwt,
    //     name: "Web3Auth Flutter Auth0 Example",
    //     clientId: "BODS765Jl7Fpp6Z4UBvWU58nPfDSGnuNaIlqyl4iCD7z5zxCqpP0NJPVffRGOWMAXw4wJTxKZxKd4zWSnWgCkO8" // auth0 client id
    // );

    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId:
      'BODS765Jl7Fpp6Z4UBvWU58nPfDSGnuNaIlqyl4iCD7z5zxCqpP0NJPVffRGOWMAXw4wJTxKZxKd4zWSnWgCkO8',
      network: Network.aqua,
      redirectUrl: redirectUrl,
      whiteLabel: WhiteLabelData(
          dark: true, name: "Pay Floxy", theme: themeMap),
    ));
  }

  Future<void> initPlatformState() async {
    HashMap<String, String> themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    redirectUrl = Uri.parse('myapp://com.example.floxy_pay/auth');

    await Web3AuthFlutter.init(
      Web3AuthOptions(

        clientId: 'BODS765Jl7Fpp6Z4UBvWU58nPfDSGnuNaIlqyl4iCD7z5zxCqpP0NJPVffRGOWMAXw4wJTxKZxKd4zWSnWgCkO8',
        network: Network.aqua,
        redirectUrl: redirectUrl,
        whiteLabel: WhiteLabelData(
          dark: true,
          name: "Floxy App",
          theme: themeMap,
        ),

      ),
    );

    await Web3AuthFlutter.initialize();



    await Web3AuthFlutter.logout();

    final Web3AuthResponse response = await Web3AuthFlutter.login(
        LoginParams(loginProvider: Provider.jwt)
    );



    final String? res = await Web3AuthFlutter.getPrivKey();
    if (res != null && res.isNotEmpty) {
      setState(() {
        logoutVisible = true;
      });
    }
  }

  @override
  void initState() {
    initPlatformState1();
    _getPrivKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

              ElevatedButton(onPressed: initPlatformState1, child: Text('Login')),

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
                      onPressed: () async {

                        await _login1(_withAuth0);

                      },
                      child: Text('Login with Web3Auth'),
                    ),

                    ElevatedButton(
                      onPressed: () async {

                        await initPlatformState;

                      },
                      child: Text('Initalise'),
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
                      onPressed: _getPrivateKey(_getPrivKey),
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
                          MaterialPageRoute(builder: (context) => BottomNavigation()),
                        );
                      },
                      child: const Text('Proceed to App'),
                    ),

                   /* ElevatedButton(

                        onPressed: _getAddress,
                        child: const Text('Get Address')),
                    ElevatedButton(

                        onPressed: _getBalance,
                        child: const Text('Get Balance')),
                    ElevatedButton(

                        onPressed: _sendTransaction,
                        child: const Text('Send Transaction')),*/


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



  VoidCallback _getPrivateKey(Future<String?> Function() method) {
    return () async {
      try {
        final String? response = await Web3AuthFlutter.getPrivKey();
        setState(() {
          _result = response!;
          logoutVisible = true;
        });

        // Save private key using shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('privateKey', response!);
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
      mfaLevel: MFALevel.OPTIONAL,
    ));
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.facebook,
      mfaLevel: MFALevel.OPTIONAL,
    ));
  }

  Future<Web3AuthResponse> _withTwitter() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.twitter,
      mfaLevel: MFALevel.OPTIONAL,
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

  VoidCallback _login1(Future<Web3AuthResponse> Function() method) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('privateKey', response.privKey.toString());
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



  Future<Web3AuthResponse> _withAuth0() {
    return Web3AuthFlutter.login(LoginParams(
        loginProvider: Provider.jwt,
        extraLoginOptions: ExtraLoginOptions(
            domain: 'https://shahbaz-torus.us.auth0.com',
            verifierIdField: 'sub')));
  }

  Future<String> _getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';
    debugPrint(privateKey);
    const String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");
    setState(() {
      _result = address.hexEip55.toString();
    });
    return address.hexEip55;
  }

  Future<EtherAmount> _getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    final balance = await client.getBalance(address);
    debugPrint(balance.toString());
    setState(() {
      _result = balance.toString();
    });
    return balance;
  }

  Future<String> _sendTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    try {
      final receipt = await client.sendTransaction(
          credentials,
          Transaction(
            from: address,
            to: EthereumAddress.fromHex(
                '0x809D4310d578649D8539e718030EE11e603Ee8f3'),
            gasPrice: EtherAmount.fromUnitAndValue(EtherUnit.gwei, 100),
            value: EtherAmount.fromUnitAndValue(
                EtherUnit.gwei, 5000000), // 0.005 ETH
          ),
          chainId: 5);
      debugPrint(receipt);
      setState(() {
        _result = receipt;
      });
      return receipt;
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
      return e.toString();
    }
  }
}
