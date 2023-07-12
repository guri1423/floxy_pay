import 'package:floxy_pay/modules/balance.dart';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_one.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_page.dart';
import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final StorageServices _servicesStorage = StorageServices();

  void getUserLoggedInStatus(BuildContext context) async {
    String? status = await _servicesStorage.getLoggedInStatus();
    if (status != null && status.contains('true')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingPage()),
      );
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getUserLoggedInStatus(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
