

import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:floxy_pay/modules/onboarding/pages/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPageTwo extends StatefulWidget {
  const OnboardingPageTwo({super.key});

  @override
  State<OnboardingPageTwo> createState() => _OnboardingPageTwoState();
}

class _OnboardingPageTwoState extends State<OnboardingPageTwo> {

  static const sizeBox =  SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60, top: 40),
            child: SizedBox(
                height: 290,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset('assets/svg_images/onboarding_page_two.svg',
                fit: BoxFit.fill,)),
          ),

          sizeBox,

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Strings.onBoardingText2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                sizeBox,

                Text(
                  Strings.onBoardingTextSub2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                sizeBox,
                sizeBox,

                DotsIndicator(
                  dotsCount: 3,
                  position: 1,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> GetStarted()));
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
                )
              ],
            ),
          ),




        ],
      ),

    );
  }
}
