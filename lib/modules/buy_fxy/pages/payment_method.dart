

import 'package:floxy_pay/modules/buy_fxy/pages/payment_success.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/header_without_backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/colors.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView(
        children: [
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
                            padding: EdgeInsets.only(left: 15, top: 30, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Text(
                                  'INR 100.00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFF7931A),
                                    fontSize: 24,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.24,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    width: 149,
                                    height: 144,
                                    child: QrImageView(
                                      data: 'This is a simple QR code',
                                      version: QrVersions.auto,
                                      size: 320,
                                      gapless: false,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    'Scan to pay',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.16,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(248, 248, 248, 1),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          child: Row(
                                            children:  [
                                              Text(
                                                'ajanta20@rbl',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.12,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              SvgPicture.asset('assets/svg_images/receive_page/copy_icon.svg')
                                            ],
                                          ),
                                        ),
                                      ),

                                      SvgPicture.asset('assets/svg_images/download_payment.svg')
                                    ],
                                  ),
                                ),

                                // SizedBox(
                                //   height: 40,
                                //   child: ListView.separated(
                                //       scrollDirection: Axis.horizontal,
                                //       shrinkWrap: true,
                                //       itemBuilder: (context, index){
                                //
                                //     return Container(
                                //       height: 40,
                                //
                                //       child: Row(
                                //         children: [
                                //           Expanded(child:SvgPicture.asset(_imageList[index]),),
                                //         ],
                                //       ),
                                //     );
                                //   }, separatorBuilder: (context, index){
                                //     return SizedBox(width: 10,);
                                //   }, itemCount: _imageList.length),
                                // )











                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ]),
          
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentSuccessful()));

            },
            child: Padding(

              padding: const EdgeInsets.only(top: 30, left: 84, right: 84),
              child: customButtonLast(context, 'CANCEL PAYMENT', Color.fromRGBO(0, 0, 0, 0.10), CustomColors.black),
            ),
          )
        ]
      ),
    );
  }

  List<String> _imageList = [
    'assets/svg_images/phonePay.svg',
    'assets/svg_images/paytm.svg',
    'assets/svg_images/upi.svg',
    'assets/svg_images/Google pay.svg'
  ];
}
