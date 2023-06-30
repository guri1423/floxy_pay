

import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:floxy_pay/modules/home/pages/home.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
                child: Image.asset('assets/images/get_started_page.png')),

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

            Row(

              children: [
                GestureDetector(

                  onTap: (){
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation()));

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
