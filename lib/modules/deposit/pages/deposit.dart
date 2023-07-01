

import 'package:floxy_pay/modules/deposit/deposit_widgets.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          children: [
            Stack(
                children: <Widget>[
                  Container(
                    height: height * 0.20,
                    decoration: const BoxDecoration(
                      color: CustomColors.blueLight,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20), // Adjust radiusValue as needed
                        bottomRight: Radius.circular(20), // Adjust radiusValue as needed
                      ),
                    ),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back),
                              Text(
                                Strings.deposit,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 120,left: 20, right: 20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: height*0.40,
                        decoration:  const BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              depositButton(context),

                              SizedBox(height: 20,),

                              Text(
                                'Your Deposits',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7200000286102295),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.16,
                                ),
                              ),

                              SizedBox(height: 20,),

                              customTextField(context, '')



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
