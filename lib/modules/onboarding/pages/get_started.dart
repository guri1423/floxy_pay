

import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:floxy_pay/modules/home/pages/home.dart';
import 'package:floxy_pay/modules/send/pages/send.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../bottom_navigation/pages/bottom_navigation.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  static const sizeBox =  SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 290,
                width: 290,
                child: SvgPicture.asset('assets/svg_images/get_started.svg')),

            sizeBox,

            Text(
              Strings.getStarted1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Text(
              Strings.getStartedText2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            sizeBox,
            sizeBox,

            DotsIndicator(
              dotsCount: 3,
              position: 2,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            Row(

              children: [
                GestureDetector(

                  onTap: (){
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SendPage()));

                  },
                  child: customButton(context),
                ),
              ],
            )




          ],
        ),
      ),

    );
  }
}
