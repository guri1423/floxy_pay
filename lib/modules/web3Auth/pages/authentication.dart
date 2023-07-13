import 'dart:collection';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/services/storage_services.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool isLoading = false;

  String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

  final StorageServices _servicesStorage = StorageServices();
  final TextEditingController _email = TextEditingController();



  @override
  void initState() {
    // initPlatformState1();
    _getPrivKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: isLoading,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 100),
                  child: Text(
                    'Sign In ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 10),
                  child: Text(
                    'Your blockchain wallet in one-click',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _login(_withGoogle)(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Container(
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 78),
                        child: SvgPicture.asset(
                            'assets/svg_images/receive_page/google_login.svg'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _login(_withFacebook)(),
                        child: Container(
                          width: 81,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: CustomColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: SvgPicture.asset(
                              'assets/svg_images/fb_login.svg'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _login(_withApple)(),
                        child: Container(
                          width: 81,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: CustomColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: SvgPicture.asset(
                              'assets/svg_images/receive_page/apple_login.svg'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _login(_withTwitter)(),
                        child: Container(
                          width: 81,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: CustomColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: SvgPicture.asset(
                              'assets/svg_images/receive_page/twitter_login.svg'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _login(_withLinkedin)(),
                        child: Container(
                          width: 81,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: CustomColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: SvgPicture.asset(
                              'assets/svg_images/receive_page/linkdin_login.svg'),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 16, right: 16, top: 40, bottom: 20),
                  child: Text(
                    'We do not store any related to your social logins.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: customTextFieldForm(context,
                      controller: _email, hintText: 'Name@example.com'),
                ),
                GestureDetector(
                  onTap: () => _login(_withEmailPasswordless)(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: customButtonLast(context, 'CONTINUE WITH EMAIL',
                        CustomColors.yellowLight, CustomColors.black),
                  ),
                )
              ],
            ),
            if (isLoading) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  VoidCallback _login(Future<Web3AuthResponse> Function() method) {
    setState(() {
      isLoading = true;
    });
    return () async {
      try {
        final Web3AuthResponse response = await method();
        if (response.privKey != null) {

          await _servicesStorage.setUserLoggedIn('true');

          await _servicesStorage.setId(response.privKey!);
          setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
            (route) => false,
          );
        } else {
          // Authentication failed
          print("Authentication failed");
        }
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

  Future<Web3AuthResponse> _withLinkedin() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.linkedin,
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
      extraLoginOptions: ExtraLoginOptions(login_hint: _email.text),
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
