import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/modules/web3Auth/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../core/strings.dart';


class OnboardingPageOne extends StatefulWidget {
  const OnboardingPageOne({super.key});

  @override
  State<OnboardingPageOne> createState() => _OnboardingPageOneState();
}

class _OnboardingPageOneState extends State<OnboardingPageOne> {
  late Material materialButton;
  late int index;

  List<PageViewModel> onboardingPagesList = [];


  static const sizeBox = SizedBox(height: 25);

  void initState() {
    super.initState();
    index = 0;
    onboardingPagesList = [
      PageViewModel(
        title: '',
        bodyWidget: SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: CustomColors.white,
              border: Border.all(
                width: 0.0,
                color: CustomColors.white,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 95),
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
                  sizeBox,
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


                ],
              ),
            ),
          ),
        ),
      ),
      PageViewModel(
        title: '',
        bodyWidget: SingleChildScrollView(
          child: DecoratedBox(
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
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
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
                      Text(
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

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      PageViewModel(
        title: '',
        bodyWidget: SingleChildScrollView(
          child: DecoratedBox(
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
                      child: SvgPicture.asset('assets/svg_images/get_started.svg')),
                  sizeBox,
                  const Text(
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
                  sizeBox,
                  const Text(
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

                  GestureDetector(
                    onTap: (){
                      navigateToNextPage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                                        child:
                                        Icon(Icons.keyboard_arrow_right, size: 40)),
                                  ),
                                ),
                                const Align(
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
                                const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child:
                                        Icon(Icons.keyboard_arrow_right, size: 40)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ];
  }

  void navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Authentication()), // Replace `NextPage` with your desired page
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
         body: IntroductionScreen(
           pages: onboardingPagesList,
           showSkipButton: false,
           showNextButton: false,
           showDoneButton: false,
           skip: const Text("Skip"),
           done: const Text("Done"),
           onDone: () {
             // On button pressed
           },
         )
      ),
    );
  }
}

