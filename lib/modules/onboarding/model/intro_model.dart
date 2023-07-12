import 'package:floxy_pay/core/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> introModel = [
  PageViewModel(
    title: Strings.onBoardingText1,
    body: Strings.onBoardingTextSub1,
    image: SizedBox(
        height: 290,
        width: 290,
        child: SvgPicture.asset('assets/svg_images/onboarding_page_one.svg')),
  ),
  PageViewModel(
    title: Strings.onBoardingText2,
    body: Strings.onBoardingTextSub2,
    image: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 290,
            width: 290,
            child:
                SvgPicture.asset('assets/svg_images/onboarding_page_two.svg')),
      ],
    ),
  ),
  PageViewModel(
    title: Strings.getStarted1,
    body: Strings.getStartedText2,
    image: SizedBox(
        height: 290,
        width: 290,
        child: SvgPicture.asset('assets/svg_images/get_started.svg')),
  ),
];
