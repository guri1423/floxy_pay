

import 'package:flutter/material.dart';

import '../core/colors.dart';

Widget customTextFieldForm(BuildContext context,
    {required TextEditingController controller,
      required String hintText,
      bool isBig = false}) {
  return TextFormField(
    keyboardType: controller.text == 'Mobile No' ||
        controller.text == 'Amount' ||
        hintText.contains('Deposit Amount') ||
        hintText.contains('Cost')
        ? TextInputType.phone
        : TextInputType.emailAddress,
    controller: controller,
    maxLines: hintText.contains('Project Details') ? 20 : isBig ? 10 : 1,
    textCapitalization: TextCapitalization.sentences,
    /* maxLines: 10,*/
    style: Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.greyLight),
    onChanged: (value) {},
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: isBig
          ? const EdgeInsets.only(top: 16, left: 10)
          : const EdgeInsets.only(top: 2, left: 10),
      hintStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: CustomColors.textFieldTextColour),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: CustomColors.textFieldBorderColor),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}