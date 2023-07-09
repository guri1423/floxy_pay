import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/modules/web3Auth/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/strings.dart';
import 'package:onboarding/onboarding.dart';

import '../../encription.dart';

class OnboardingPageOne extends StatefulWidget {
  const OnboardingPageOne({super.key});

  @override
  State<OnboardingPageOne> createState() => _OnboardingPageOneState();
}

class _OnboardingPageOneState extends State<OnboardingPageOne> {
  late Material materialButton;
  late int index;

  List<PageModel> onboardingPagesList = [];

  static const sizeBox = SizedBox(height: 25);

  void initState() {
    super.initState();
    index = 0;
    onboardingPagesList = [
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              width: 0.0,
              color: CustomColors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 290,
                    width: 290,
                    child: SvgPicture.asset(
                        'assets/svg_images/onboarding_page_one.svg')),
                sizeBox,
                const Text(
                  Strings.onBoardingText1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: "Lato",
                    letterSpacing: 0.26,
                  ),
                ),
                const Text(
                  Strings.onBoardingTextSub1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: "Lato",
                    letterSpacing: 0.15,
                  ),
                ),
                sizeBox,
                sizeBox,
                DotsIndicator(
                  dotsCount: 3,
                  position: 0,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const ShapeDecoration(
                            color: CustomColors.roundButtonColor,
                            shape: CircleBorder(),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              width: 0.0,
              color: CustomColors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 290,
                        child: SvgPicture.asset(
                          'assets/svg_images/onboarding_page_two.svg',
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
              ),
              sizeBox,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      Strings.onBoardingText2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: "Lato",
                        letterSpacing: 0.26,
                      ),
                    ),
                    sizeBox,
                    const Text(
                      Strings.onBoardingTextSub2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: "Lato",
                        letterSpacing: 0.15,
                      ),
                    ),
                    sizeBox,
                    sizeBox,
                    DotsIndicator(
                      dotsCount: 3,
                      position: 1,
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: const ShapeDecoration(
                                color: CustomColors.roundButtonColor,
                                shape: CircleBorder(),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              size: 60,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              width: 0.0,
              color: CustomColors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 290,
                    width: 290,
                    child:
                        SvgPicture.asset('assets/svg_images/get_started.svg')),
                sizeBox,
                Text(
                  Strings.getStarted1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: "Lato",
                    letterSpacing: 0.26,
                  ),
                ),
                Text(
                  Strings.getStartedText2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: "Lato",
                    letterSpacing: 0.15,
                  ),
                ),
                sizeBox,
                sizeBox,
                DotsIndicator(
                  dotsCount: 3,
                  position: 2,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateToNextPage();
                  },
                  child: Container(
                    height: 60,
                    decoration: ShapeDecoration(
                      color: CustomColors.roundButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                width: 58,
                                height: 58,
                                decoration: const ShapeDecoration(
                                  color: CustomColors.white,
                                  shape: CircleBorder(),
                                ),
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.keyboard_arrow_right,
                                        size: 40)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                Strings.letsStarted,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: CustomColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: "Lato",
                                  letterSpacing: 0.16,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.keyboard_arrow_right,
                                        size: 40)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ];
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  void navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Authentication()), // Replace `NextPage` with your desired page
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
