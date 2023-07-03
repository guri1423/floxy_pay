

import 'package:floxy_pay/modules/buy_now_pop_up/widget/widget_buy_now.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({super.key});

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Stack(
            children: [
              Stack(
                  children: [
                    Stack(
                        children: <Widget>[
                          topWidgetBuyNow(context),

                          bodyWidgetBuyNow(context),

                        ]),

                    buttonArea(context)
                  ]
              ),
            ]
          ),

          Stack(
            alignment: Alignment.center,
            children: <Widget>[

              bottomArea(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3E2CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: Center(
                    child: Text(
                      'SWAP NOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ),
              )
            ]
          )


        ],
      ),
    );
  }
}
