import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/modules/home/widgets/home_header.dart';
import 'package:floxy_pay/modules/home/widgets/home_widgets.dart';
import 'package:floxy_pay/modules/home/widgets/recommend_to_buy_widget.dart';
import 'package:floxy_pay/modules/home/widgets/your_token_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
            HomeHeaderWidget(),
            YourTokenWidget(),
            RecommendedToBuyWidget()
      ],
    ));
  }
}
