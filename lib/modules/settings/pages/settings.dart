

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/header_widget.dart';

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
                HeaderWidget(title: Strings.setting),

                Padding(
                  padding: const EdgeInsets.only(top: 120,left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                      height: 328,
                      decoration:  const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListView.builder(
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                          decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: CustomColors.white),

                                  child: SvgPicture.asset(imageList[index])),

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
