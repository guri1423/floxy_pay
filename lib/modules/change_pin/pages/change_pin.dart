
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/custom_textField.dart';
import '../../../widgets/header_widget.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {

  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmPin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  ListView(
          children: [
            Stack(
                children: <Widget>[
                  HeaderWidget(title: Strings.changePin),

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
                              padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text(
                                    Strings.pleaseEnterPin,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.800000011920929),
                                      fontSize: 16,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                                    child: customTextFieldForm(context, controller: _pin, hintText: 'Pin'),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 20),
                                    child: customTextFieldForm(context, controller: _confirmPin, hintText: 'Confirm Pin'),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only( bottom: 24),
                                    child: customButtonNew(context, 'UPDATE', CustomColors.black, CustomColors.white),
                                  )













                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  )
                ]
            ),

          ],
        )
    );
  }
}
