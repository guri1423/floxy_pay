
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/common_widgets.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
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
                          Strings.sale,
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
                        Strings.saleFXY,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      sizebox,

                      customTextField(context, Strings.name),

                      sizebox,

                      customTextField(context, Strings.mobileNo),

                      sizebox,

                      customTextField(context, Strings.amount),

                      sizebox,

                      customTextField(context, Strings.fxyToken),

                      sizebox,

                      customTextField(context, Strings.bankAccount),

                      sizebox,

                      customTextField(context, Strings.bankIfsc),

                      sizebox,


                      customSmallButton(context, Strings.saleNow, CustomColors.black, CustomColors.white),


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
