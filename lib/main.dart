import 'dart:collection';

import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/theme.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_one.dart';
import 'package:floxy_pay/modules/onboarding/pages/splash_page.dart';
import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'modules/bottom_navigation/bloc/bottom_navigation_cubit.dart';
import 'modules/bottom_navigation/pages/bottom_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: CustomColors.blueLight, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> web3AuthInitialization() async {
    final themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    redirectUrl = Uri.parse('myapp://com.example.floxy_pay/auth');

    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId:
          'BODS765Jl7Fpp6Z4UBvWU58nPfDSGnuNaIlqyl4iCD7z5zxCqpP0NJPVffRGOWMAXw4wJTxKZxKd4zWSnWgCkO8',
      network: Network.aqua,
      redirectUrl: redirectUrl,
      whiteLabel:
          WhiteLabelData(dark: true, name: "Pay Floxy", theme: themeMap),
    ));
  }

  @override
  void initState() {
    web3AuthInitialization();
    super.initState();
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
        home: const SplashPage(),
        theme: CustomThemes.getTheme(),
      ),
    );
  }
}
