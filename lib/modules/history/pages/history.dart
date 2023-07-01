

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
                                Strings.history,
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
                        height: height*0.30,
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

                              const SizedBox(height: 20,),


                              DropdownBox(),

                              const SizedBox(height: 20,),


                               Text(Strings.lastTransaction,
                              style: Theme.of(context).textTheme.titleSmall,)





                            ],
                          ),
                        )
                    ),
                  )
                ]
            ),

            SizedBox(height: 30,),

            SvgPicture.asset('assets/svg_images/history_page.svg')
          ],
        )
    );
  }
}
