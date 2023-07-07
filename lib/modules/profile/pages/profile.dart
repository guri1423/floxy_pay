

import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController _userName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobileNo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body:  ListView(
        children: [
          Stack(
              children: <Widget>[

                HeaderWidget(title: Strings.profile),

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

                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: CustomColors.white),
                                  child: const Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 4,),

                                const Center(
                                  child: Text(
                                    'Upload Image',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF7931A),
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,

                                    ),
                                  ),
                                ),

                                Text(
                                  'User Name',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.800000011920929),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                                  child: customTextFieldForm(context, controller: _userName, hintText: 'Enter your user name'),
                                ),

                                Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.800000011920929),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                                  child: customTextFieldForm(context, controller: _email, hintText: 'Enter your email'),
                                ),

                                Text(
                                  'Mobile No',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.800000011920929),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                                  child: customTextFieldForm(context, controller: _mobileNo, hintText: 'Enter your mobile number'),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top:20, bottom: 48),
                                  child: customButtonNew(context, 'SAVE CHANGES', CustomColors.black, CustomColors.white),
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
