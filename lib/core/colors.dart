import 'package:flutter/material.dart';

class CustomColors {
  static const Color white = Colors.white;
  static const black = Colors.black;

  Color get blackWithOpacity => Colors.black.withOpacity(0.5);
  static const roundButtonColor = Color(0xFFF3E2CC);
  static const transparent = Colors.transparent;
  static const grey = Color(0xff969696);
  static const blueLight = Color(0xFFD5E1FF);
  static const yellowLight = Color(0xFFFFE7CB);
  static const blueExtremeLight = Color(0xFFEBF6F9);
  static const greyLight = Color(0xFFE6EDEF);
  static const pinkLight = Color(0xFFF4E2FF);

  static const blueCheckBox = Color(0xff3988ff);
  static const blueCheckBoxSecond = Color(0xff11244c);
  static const pinkCheckBox = Color(0xff9646ae);
  static const pinkCheckBoxSecond = Color(0xff240928);
  static const skyBlueButton = Color(0xff00ffff);

  static const textFieldBorderColor = Color.fromRGBO(204, 204, 204, 1);
  static const textFieldTextColour = Color.fromRGBO(204, 204, 204, 1);

  static const backgroundColour = Color(0xFFEAEBEB);
  static const fieldBorderColour = Color(0xFFCCCCCC);
  static const token1 = Color.fromRGBO(255, 231, 203, 1);
  static const token2 = Color.fromRGBO(235, 246, 249, 1);
  static const token3 = Color.fromRGBO(235, 249, 235, 1);
  static const recommended1 = Color.fromRGBO(230, 237, 239, 1);
  static const recommended2 = Color.fromRGBO(244, 226, 255, 1);
  static const subTitleColor = Color.fromRGBO(77, 77, 77, 1);

  static TextStyle hintTextStyle = const TextStyle(
      color: Color.fromRGBO(204, 204, 204, 1),
      fontWeight: FontWeight.w500,
      fontSize: 12);
}
