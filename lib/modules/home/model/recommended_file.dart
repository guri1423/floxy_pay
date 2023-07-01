import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';

class RecommendedToBuy {
  final String title;
  final String subTitle;
  final String value;
  final String netProfit;
  final String iconSrc;
  final Color bgColor;

  RecommendedToBuy(
      {required this.title,
        required this.value,
        required this.iconSrc,
        required this.netProfit,
        required this.subTitle,
        required this.bgColor});

  static List<RecommendedToBuy> allRecommendation = [
    RecommendedToBuy(
        title: "USDT",
        value: "45,338.11Matic",
        iconSrc: "assets/svg_images/",
        netProfit: "+1.35%",
        subTitle: "Ethereum",
        bgColor: CustomColors.recommended1),
    RecommendedToBuy(
        title: "USDT",
        value: "2,439.82ETH",
        iconSrc: "assets/svg_images/",
        netProfit: "+2.49%",
        subTitle: "Matic",
        bgColor: CustomColors.recommended2),

  ];
}
