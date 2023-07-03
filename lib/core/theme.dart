
import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';


class CustomThemes{

  static ThemeData getTheme(){

    return ThemeData(
        primaryColor:const Color.fromRGBO(39, 69, 89, 1),
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(

          titleLarge: TextStyle(
              color: CustomColors.black, fontWeight: FontWeight.w700, fontSize: 24,fontFamily: "Lato",
            letterSpacing: 0.26,

          ),


          titleMedium: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: "Lato",letterSpacing: 0.16,
          ),

          titleSmall: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w600, fontSize: 12,fontFamily: "Lato", letterSpacing: 0.15,
          ),

          headlineSmall: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w600, fontSize: 14,fontFamily: "Lato", letterSpacing: 0.15,
          ),


          bodyLarge: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.normal, fontSize: 18,fontFamily: "Lato",
            letterSpacing: 0.26,

          ),

          bodyMedium:  TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.normal, fontSize: 16,fontFamily: "Lato",letterSpacing: 0.14,
          ),

          bodySmall: TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.normal, fontSize: 12,fontFamily: "Lato", letterSpacing: 0.15,
          ),





        )
    );
  }

}