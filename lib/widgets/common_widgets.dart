import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton(context){

  return Container(

    width: MediaQuery.of(context).size.width *0.80,

    height: 60,
    decoration: ShapeDecoration(
      color: CustomColors.roundButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Stack(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 58,
                height: 58,
                decoration: const ShapeDecoration(
                  color: CustomColors.white,
                  shape: CircleBorder(),
                ),
                child: const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.keyboard_arrow_right, size: 40)),
              ),

            ),

            Align(
              alignment: Alignment.center,
              child: Text(
                Strings.letsStarted,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

             Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right, size: 40)),
              ],
            ),
          ],
        ),



      ],
    ),
  );
}


Widget customSmallButton(context, String text, Color backgroundColor, Color textColor){

  return Container(
    width: 75,
    height: 26,
    decoration:  BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
      ),
    ),
  );
}


Widget customTextField(context, String hintText){

  return Container(
    height: 50,
    color: Colors.white,
    child: TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
  );
}


Widget customButtonNew(context, String text, Color backgroundColor, Color textColor){

  return Container(
    height: 42,
    width: 139,
    decoration:  BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(110)),
    ),
    child: Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}


Widget customButtonLast(context, String text, Color backgroundColor, Color textColor){

  return Container(
    decoration:  BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(110)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}