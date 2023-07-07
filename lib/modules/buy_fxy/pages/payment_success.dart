
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/header_without_backButton.dart';
import '../../bottom_navigation/pages/bottom_navigation.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({super.key});

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
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


                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
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

                                const Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+ 100 FXY',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      SizedBox(width: 5,),

                                      Text(
                                        '=',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      SizedBox(width: 5,),

                                      Text(
                                        '100 INR',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),














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
            padding: const EdgeInsets.only(left: 16, right: 16, top:30),
            child: Row(
              children: [

                Text(
                  'Date',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Spacer(),

                Text(
                  '3 july, 2023, 1:20:31pm',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,

                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top:30),
            child: Row(
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,

                  ),
                ),

                Spacer(),

                Text(
                  'Confirmed',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top:30),
            child: Row(
              children: [
                Text(
                  'Sender',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,

                  ),
                ),

                Spacer(),

                Text(
                  '0xf227047e682d73ff9812e2ed\ncd1b93d18553b1c6',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top:30),
            child: Row(
              children: [
                Text(
                  'Hash',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Spacer(),

                Text(
                  '0x83c60a1782149413b9611e5d\nc33b689454726a5bf8874cfa\nd27136e369b6c86',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,

                  ),
                )
              ],
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
