
import 'package:floxy_pay/modules/sale/pages/sale.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    SizedBox sizebox = const SizedBox(height: 10);
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        Text(
                          Strings.send,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 120,left: 20, right: 20),
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
                                style: Theme.of(context).textTheme.titleSmall,
                              ),

                              sizebox,

                              Text(
                                Strings.tenThousandFXY,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),

                              sizebox,

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: customSmallButton(context, Strings.buyFxy, CustomColors.white, CustomColors.black)
                              ),


                            ],
                          ),
                        ),

                      ),

                      sizebox,

                      Text(
                        Strings.sendFXY,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      sizebox,

                      customTextField(context, Strings.address),

                      sizebox,

                      customTextField(context, Strings.amount),

                      sizebox,


                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SalePage()));
                          },
                          child: customSmallButton(context, Strings.process, CustomColors.black, CustomColors.white)),


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
