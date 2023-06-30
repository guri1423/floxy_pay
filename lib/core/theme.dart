
import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';


class CustomThemes{

  static ThemeData getTheme(){

    return ThemeData(
        primaryColor:const Color.fromRGBO(39, 69, 89, 1),
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(

          titleLarge: TextStyle(
              color: CustomColors.black, fontWeight: FontWeight.w700, fontSize: 26,fontFamily: "Lato",
            letterSpacing: 0.26,

          ),


          titleMedium: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w600, fontSize: 20,fontFamily: "Lato",letterSpacing: 0.16,
          ),

          titleSmall: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w500, fontSize: 15,fontFamily: "Lato", letterSpacing: 0.15,
          ),





        )
    );
  }

}