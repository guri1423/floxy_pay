
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors.dart';
import '../../core/strings.dart';

Widget depositButton(context){

  return Container(
    width: 140,
    height: 46,
    decoration:  BoxDecoration(
      color: CustomColors.black,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg_images/icon _deposit.svg'),

          SizedBox(width: 20,),

          Center(
            child: Text(
              Strings.deposit,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: CustomColors.white),
            ),
          ),

        ],
      ),
    ),
  );
}