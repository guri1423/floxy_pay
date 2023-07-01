

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return  Scaffold(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 40),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text(
                              Strings.setting,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 120,left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                      height: height*0.40,
                      decoration:  const BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListView.builder(
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [

                              SvgPicture.asset(imageList[index]),

                              Text(pageList[index],
                              style: Theme.of(context).textTheme.titleSmall,),

                              Spacer(),

                              Icon(Icons.navigate_next_sharp)

                            ],
                          ),
                        );
                      },

                    )
                  ),
                )
              ]
          ),
        ],
      )
    );
  }

  List<String> imageList = [

    'assets/svg_images/profileIcon.svg',
    'assets/svg_images/change_pin.svg',
    'assets/svg_images/logout_icon.svg',
    'assets/svg_images/notification_icon.svg'
  ];

  List<String> pageList = [
    'Profile',
    'Notification',
    'Change Pin',
    'Logout'
  ];
}
