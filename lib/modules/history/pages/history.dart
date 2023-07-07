

import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/drop_down.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
          children: [
            Stack(
                children: <Widget>[

                  HeaderWidgetWithoutBackButton(title: Strings.history),

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    'Select Token',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7200000286102295),
                                      fontSize: 16,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.16,
                                    ),
                                  ),

                                  const SizedBox(height: 5,),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 42),
                                    child: DropdownBox(),
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

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                Strings.lastTransaction,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.18,
                ),
              ),
            ),

            SizedBox(height: 30,),

            SvgPicture.asset('assets/svg_images/history_page.svg')
          ],
        )
    );
  }
}
