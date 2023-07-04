
import 'package:floxy_pay/modules/sale/pages/sale_successful.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/custom_textField.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}


class _SalePageState extends State<SalePage> {

  TextEditingController _name = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _amountNumber = TextEditingController();
  TextEditingController _fxyToken = TextEditingController();
  TextEditingController _bankAccountNo = TextEditingController();
  TextEditingController _ifscCode = TextEditingController();
  TextEditingController _pin = TextEditingController();




  @override
  Widget build(BuildContext context) {
    SizedBox sizeBox = const SizedBox(height: 10);
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(

        children: [
          Stack(
              children: <Widget>[
                HeaderWidget(title: Strings.sale),

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

                      sizeBox,

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const SizedBox(
                          child: Text(
                            Strings.saleFXY,
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



                      customTextFieldForm(context, controller: _name, hintText: Strings.name),



                      customTextFieldForm(context, controller: _mobileNumber, hintText: Strings.mobileNo),



                      customTextFieldForm(context, controller: _amountNumber, hintText: Strings.amount),



                      customTextFieldForm(context, controller: _fxyToken, hintText: Strings.fxyToken),



                      customTextFieldForm(context, controller: _bankAccountNo, hintText: Strings.bankAccount),



                      customTextFieldForm(context, controller: _ifscCode, hintText: Strings.bankIfsc),


                      SizedBox(height: 5,),




                      GestureDetector(

                          onTap: (){
                            _showDialog(context);
                          },
                          child: customButtonNew(context, Strings.saleNow, CustomColors.black, CustomColors.white)),


                    ],
                  ),
                )
              ]
          ),

        ],
      ),

    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
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
                                _enterPinDialog(context);
                              },
                              child: Center(
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
                  SvgPicture.asset('assets/svg_images/close_icon.svg'),
                ],
              )
            ]
          )
        );
      },
    );
  }

  Future<void> _enterPinDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
            content: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(

                    width:280,
                    height: 240,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),

                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SvgPicture.asset('assets/svg_images/pin_popup.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Please Enter Pin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(height: 8,),

                        SizedBox(
                            height: 40,
                            child: customTextFieldForm(context, controller: _pin, hintText: '')),

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
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SaleSuccessful(

                                  )), (route) => false);
                                  },
                                  child: Center(
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
                      SvgPicture.asset('assets/svg_images/close_icon.svg'),
                    ],
                  )
                ]
            )
        );
      },
    );
  }



}
