import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';

class YourTokens {
  final String title;
  final String subTitle;
  final String value;
  final String netProfit;
  final String iconSrc;
  final Color bgColor;

  YourTokens(
      {required this.title,
      required this.value,
      required this.iconSrc,
      required this.netProfit,
      required this.subTitle,
      required this.bgColor});

  static List<YourTokens> allYourTokens = [
    YourTokens(
        title: "Matic",
        value: "45,338.11Matic",
        iconSrc: "assets/svg_images/bitcoin.svg",
        netProfit: "+2.49%",
        subTitle: "Matic",
        bgColor: CustomColors.token1),
    YourTokens(
        title: "ETH",
        value: "2,439.82ETH",
        iconSrc: "assets/svg_images/eth.svg",
        netProfit: "+2.49%",
        subTitle: "Ethereum",
        bgColor: CustomColors.token2),
    YourTokens(
        title: "Matic",
        value: "45,338.11Matic",
        iconSrc: "assets/svg_images/bitcoin.svg",
        netProfit: "+2.49%",
        subTitle: "Matic",
        bgColor: CustomColors.token3),
  ];
}
