

import 'package:flutter/material.dart';

import '../../../core/colors.dart';

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
          Container(
            height: height * 0.20,
            decoration: const BoxDecoration(
              color: CustomColors.blueLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5), // Adjust radiusValue as needed
                bottomRight: Radius.circular(5), // Adjust radiusValue as needed
              ),
            ),
          )

        ],
      )
    );
  }
}
