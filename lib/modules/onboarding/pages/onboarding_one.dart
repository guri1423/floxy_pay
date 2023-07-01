

import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/strings.dart';

class OnboardingPageOne extends StatefulWidget {
  const OnboardingPageOne({super.key});

  @override
  State<OnboardingPageOne> createState() => _OnboardingPageOneState();
}

class _OnboardingPageOneState extends State<OnboardingPageOne> {

  static const sizeBox =  SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(



      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 290,
                width: 290,
                child: SvgPicture.asset('assets/svg_images/onboarding_page_one.svg')),

             sizeBox,

             Text(
              Strings.onBoardingText1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),

             Text(
              Strings.onBoardingTextSub1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            sizeBox,
            sizeBox,

           DotsIndicator(
              dotsCount: 3,
              position: 0,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingPageTwo()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: const ShapeDecoration(
                          color: CustomColors.roundButtonColor,
                          shape: CircleBorder(),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 60,),
                    ],
                  ),
                ),
              ],
            ),




          ],
        ),
      ),

    );
  }
}
