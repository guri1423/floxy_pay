
import 'package:flutter/material.dart';

import '../core/colors.dart';

class HeaderWithoutBack extends StatefulWidget {
  const HeaderWithoutBack({super.key});

  @override
  State<HeaderWithoutBack> createState() => _HeaderWithoutBackState();
}

class _HeaderWithoutBackState extends State<HeaderWithoutBack> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: CustomColors.blueLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20, top: 51, right: 20, bottom: 72),
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
