

import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/modules/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(


      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: height * 0.20,
                decoration: const BoxDecoration(
                  color: CustomColors.blueLight,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20), // Adjust radiusValue as needed
                    bottomRight: Radius.circular(20), // Adjust radiusValue as needed
                  ),
                ),

                child: Column(
                  children: [
                    profilePic(context),

                    fxyRow(context),

                    thirdRow(context)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 120,left: 20, right: 20),
                child: Container(
                  alignment: Alignment.centerRight,
                  height: height * 0.10,
                  decoration:  const BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: buttonRow(context),
                ),
              )
            ]
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            Strings.yourToken,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Expanded(
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 900,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 161,
                          height: 223,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFE7CB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      )
    );
  }
}
