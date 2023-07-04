

import 'package:floxy_pay/modules/bottom_navigation/pages/bottom_navigation.dart';
import 'package:floxy_pay/modules/home/pages/home.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:floxy_pay/widgets/header_without_backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';

class SaleSuccessful extends StatefulWidget {
  const SaleSuccessful({super.key});

  @override
  State<SaleSuccessful> createState() => _SaleSuccessfulState();
}

class _SaleSuccessfulState extends State<SaleSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(children: [

        Stack(
            children: <Widget>[
              HeaderWithoutBack(),

              Padding(
                padding: const EdgeInsets.only(top: 91,left: 16, right: 16),
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:  const BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SvgPicture.asset('assets/svg_images/successful_tick.svg',),


                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Sale Transaction Approved',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                child: Text(
                                  'Your transaction has been sent. It might take a few minutes to appear on your transaction list.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),



                              const SizedBox(height: 5,),











                            ],
                          ),
                        )
                    ),
                  ],
                ),
              )
            ]
        ),

        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Text(
            'Transaction Hash:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.800000011920929),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            '0x52a8bf2507878208c18d989d5dad41a808\n0508a43d8fdba9afe336ecc6a9',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,

            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 24, left: 100, right: 100),
          child: GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> BottomNavigation()), (route) => false);
              },
              child: customButtonNew(context, 'GO TO HOME', CustomColors.black, CustomColors.white)),
        )

      ])
    );
  }
}
