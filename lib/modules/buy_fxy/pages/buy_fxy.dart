
import 'package:floxy_pay/modules/buy_fxy/pages/payment_method.dart';
import 'package:floxy_pay/modules/buy_fxy/pages/payment_success.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/header_widget.dart';

class BuyFxy extends StatefulWidget {
  const BuyFxy({super.key});

  @override
  State<BuyFxy> createState() => _BuyFxyState();
}

class _BuyFxyState extends State<BuyFxy> {

  TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SizedBox sizeBox = const SizedBox(height: 10);
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            HeaderWidget(title: Strings.buyFxy),
            Padding(
              padding: const EdgeInsets.only(top: 106, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      color: CustomColors.yellowLight,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Text(
                        'Enter amount how much do you want to buy FXY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.800000011920929),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          customTextFieldForm(context, controller: _amount, hintText: ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          ]),
          
          GestureDetector(
            onTap: (){
              print("(((((");
              _showDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 31, right: 31),
              child: customButtonLast(context, 'BUY NOW', CustomColors.black, CustomColors.white),
            ),
          )

        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    print("dafj");
     showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
            content: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(

                    width:280,
                    height: 190,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),

                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SvgPicture.asset('assets/svg_images/pop_dialog_image.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Are you sure want to process? ',
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
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [

                              Container(
                                width: 106,
                                height: 42,
                                decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: (){

                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> PaymentMethod()), (route) => false);

                                  },
                                  child: const Center(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Spacer(),

                              Container(
                                width: 106,
                                height: 42,
                                decoration: ShapeDecoration(
                                  color: Colors.black.withOpacity(0.10000000149011612),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'CANCEL',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svg_images/close_icon.svg')),
                    ],
                  )
                ]
            )
        );
      },
    );
  }
}
