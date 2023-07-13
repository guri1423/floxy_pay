import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/modules/onboarding/model/intro_model.dart';
import 'package:floxy_pay/modules/web3Auth/pages/authentication.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IntroductionScreen(
              pages: introModel,
              showNextButton: true,
              controlsPadding: const EdgeInsets.only(top: 10, bottom: 80),
              pagesAxis: Axis.horizontal,
              next: Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: const ShapeDecoration(
                    color: CustomColors.roundButtonColor,
                    shape: CircleBorder(),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 36,
                      color: CustomColors.black,
                    ),
                  ),
                ),
              ),
              done: const Padding(
                padding: EdgeInsets.only(top: 188),
                child: SizedBox.shrink(),
              ),
              onDone: () {},
              onChange: (int page) {
                if (page == 2) {
                  setState(() {
                    isDone = true;
                  });
                } else {
                  setState(() {
                    isDone = false;
                  });
                }
              },
            ),
            Visibility(
              visible: isDone,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Authentication()));
                  },
                  child: customButton(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
