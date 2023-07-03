

import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/strings.dart';
import '../../../widgets/common_widgets.dart';

class SwapPage extends StatefulWidget {
  const SwapPage({super.key});

  @override
  State<SwapPage> createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {

  TextEditingController _fxy = TextEditingController();

  TextEditingController _matic = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SizedBox sizeBox = const SizedBox(height: 10);
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;


    return Scaffold(

      body: ListView(
        children: [
          Stack(

              children: [

                HeaderWidget(title: Strings.swap),

                Padding(
                  padding: const EdgeInsets.only(top: 106,left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,

                        decoration:  const BoxDecoration(
                          color: CustomColors.yellowLight,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.currentBalance,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              sizeBox,

                              Text(
                                Strings.tenThousandFXY,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),

                              sizeBox,

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: customSmallButton(context, Strings.buyFxy, CustomColors.white, CustomColors.black)
                              ),



                            ],
                          ),
                        ),

                      ),




                    ],
                  ),
                )

              ]),
          
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        customTextFieldForm(context, controller: _fxy, hintText: '0.548 FXY'),

                        customTextFieldForm(context, controller: _matic, hintText: '0.548 MATIC'),
                      ],
                    ),

                    SvgPicture.asset('assets/svg_images/exchange_icon.svg')

                  ],
                ),




                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '1 FXY = 0,00029 MATIC',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.14,
                    ),
                  ),
                ),


                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Container(
                      height: 60,
                         width: 343,
                  decoration:  BoxDecoration(
                      color: CustomColors.black,
                        borderRadius: BorderRadius.all(Radius.circular(110)),
                                            ),
                               child: Center(
                              child: Text(
    'EXCHANGE',
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600,color: CustomColors.white),
    ),
    ),
    ),
                    )




              ],
            ),
          )

          
        ],
      ),
    );
  }
}
