import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';

Widget profilePic(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: CustomColors.white),
        child: const Center(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
      const Spacer(),
      SvgPicture.asset(
        'assets/svg_images/notificationImage.svg',
        height: 28,
        width: 28,
      )
    ],
  );
}

Widget fxyRow(context) {
  return Row(
    children: [
      Expanded(
        child: Text(
          Strings.fxyText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Container(
        height: 36,
        decoration: const BoxDecoration(
          color: CustomColors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            Strings.buyFxy,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.white),
          ),
        ),
      )
    ],
  );
}

Widget thirdRow(context) {
  return Row(
    children: [
      Container(
        height: 36,
        decoration: const BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            Strings.percentageTwo,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      Text(
        Strings.percentageOne,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ],
  );
}

Widget buttonRow(context) {
  return Row(
    children: [
      Expanded(
        child: Container(
          child: SvgPicture.asset(
            'assets/svg_images/sendButton.svg',
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: SvgPicture.asset(
            'assets/svg_images/receiveButton.svg',
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: SvgPicture.asset(
            'assets/svg_images/swapButton.svg',
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: SvgPicture.asset(
            'assets/svg_images/saleButton.svg',
          ),
        ),
      ),
    ],
  );
}
