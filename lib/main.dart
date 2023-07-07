import 'package:floxy_pay/core/theme.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_one.dart';
import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/bottom_navigation/bloc/bottom_navigation_cubit.dart';
import 'modules/bottom_navigation/pages/bottom_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StorageServices _servicesStorage = StorageServices();

  void getUserLoggedInStatus(BuildContext context) async {
    String? status = await _servicesStorage.getLoggedInStatus();
    if (status != null && status.contains('true')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPageOne()),
            (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getUserLoggedInStatus(context);
    });
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
          builder: (context) {
            // Store the context to be used for navigation
            getUserLoggedInStatus(context);
            // Return the desired home page
            return OnboardingPageOne();
          },
        ),
        theme: CustomThemes.getTheme(),
      ),
    );
  }
}
