

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/colors.dart';
import '../../../widgets/common_widgets.dart';

Widget topWidgetBuyNow(context){

  return Container(
    height: 120,
    decoration:  BoxDecoration(
      color: CustomColors.darkGreyColor,
    ),
  );
}


Widget bodyWidgetBuyNow(context){

  return Padding(
    padding: const EdgeInsets.only(top: 63),
    child: Container(
      decoration:  BoxDecoration(
        color: CustomColors.yellowBackground,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg_images/icon _candle.svg'),
                Spacer(),
                SvgPicture.asset('assets/svg_images/dots_icon.svg')
              ],
            ),
          ),

          Text(
            'MATIC',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.17,
            ),
          ),

          SizedBox(height: 6,),

          Text(
            '39,334,09',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.24,
            ),
          ),

          SizedBox(height: 6,),

          customSmallButton(context, '+2.49', CustomColors.white, CustomColors.black),

          SizedBox(height: 230,),

          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 22,
              child: ListView.separated(
                shrinkWrap: true,

                scrollDirection: Axis.horizontal,

                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 34);
                },
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 29,
                        height: 29,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: Colors.black.withOpacity(0.20000000298023224),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'W',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF656565),
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w800,

                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  );
                },

              ),
            ),
          ),

          SizedBox(height: 40,)




        ],
      ),
    ),
  );
}


Widget buttonArea(context){

  return Padding(
    padding: const EdgeInsets.only(top: 500),
    child: Container(
        decoration:  BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.only(
        topLeft:  Radius.circular(40),
    topRight: Radius.circular(40),
    ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 43),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg_images/send_button.svg'),
          SizedBox(width: 5,),
          Text(
            'SEND',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.16,
            ),
          ),

          Spacer(),

          SvgPicture.asset('assets/svg_images/receive_icon.svg'),
          SizedBox(width: 5,),
          Text(
            'RECEIVE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.16,
            ),
          )
        ],
      ),
    ),
    ),
  );
}

Widget bottomArea(context){
  
  return Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: Container(
        height: 128,
        decoration:  const BoxDecoration(
        color: CustomColors.black,
        borderRadius: BorderRadius.all(Radius.circular(30)
    ),
    ),),
  );
}