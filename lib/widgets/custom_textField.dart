import 'package:flutter/material.dart';
import '../core/colors.dart';
import 'package:flutter/services.dart';

Widget customTextFieldForm(
    BuildContext context, {
      required TextEditingController controller,
      required String hintText,
      bool isBig = false,
      VoidCallback? onQRCodeIconTap,
    }) {
  final isAmountField = hintText == 'Amount';

  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.titleSmall!,
          onChanged: (value) {},
          inputFormatters: isAmountField ? [FilteringTextInputFormatter.digitsOnly] : null,
          keyboardType: isAmountField ? TextInputType.number : null,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: isBig ? const EdgeInsets.only(top: 16, left: 10) : const EdgeInsets.only(top: 2, left: 10),
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: CustomColors.textFieldTextColour),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
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
        ),
        if (hintText == 'Recepient Address')
          IconButton(
            onPressed: onQRCodeIconTap,
            icon: Icon(Icons.qr_code),
          ),
      ],
    ),
  );
}








