
import 'package:floxy_pay/modules/deposit/deposit_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/header_widget.dart';
import '../../token_report_pop_up/pages/buy_now.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {

  TextEditingController _deposit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          children: [
            Stack(
                children: <Widget>[
                  HeaderWidgetWithoutBackButton(title: Strings.deposit),

                  Padding(
                    padding: const EdgeInsets.only(top: 120,left: 16, right: 16),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:  const BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              GestureDetector(
                                  onTap: (){
                                    
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyNowPage()));
                                  },
                                  
                                  child: depositButton(context)),



                              Padding(
                                padding: const EdgeInsets.only(top: 30, bottom: 5),
                                child: Text(
                                  'Your Deposits',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7200000286102295),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                              ),



                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: customTextFieldForm(context, controller: _deposit , hintText: ''),
                              )



                            ],
                          ),
                        )
                    ),
                  )
                ]
            ),
          ],
        )
    );
  }
}
