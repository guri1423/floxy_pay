
import 'package:floxy_pay/modules/sale/pages/sale.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../buy_fxy/pages/buy_fxy.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {

  TextEditingController _address = TextEditingController();
  TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizedBox sizebox = const SizedBox(height: 10);
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(

        children: [
          Stack(
              children: <Widget>[

                HeaderWidget(title: Strings.send),

                Padding(
                  padding: const EdgeInsets.only(top: 106,left: 20, right: 20),
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
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),

                              sizebox,

                              Text(
                                Strings.tenThousandFXY,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),

                              sizebox,

                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyFxy()));
                                  },
                                  child: customSmallButton(context, Strings.buyFxy, CustomColors.white, CustomColors.black)),


                            ],
                          ),
                        ),

                      ),

                      sizebox,

                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 24),
                        child: Text(
                          Strings.sendFXY,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),

                     customTextFieldForm(context, controller: _address, hintText: Strings.address),

                     customTextFieldForm(context, controller: _amount, hintText: Strings.amount),

                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SalePage()));
                          },
                          child: customButtonNew(context, Strings.process, CustomColors.black, CustomColors.white)),


                    ],
                  ),
                )
              ]
          ),

        ],
      ),

    );
  }
}
