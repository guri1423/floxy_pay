

import 'package:flutter/material.dart';

import '../../../core/colors.dart';

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
                    child: Column(
                      children: [

                      ],
                    )
                  ),
                )
              ]
          ),
        ],
      )
    );
  }
}
