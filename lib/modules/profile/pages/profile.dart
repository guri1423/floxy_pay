import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<TorusUserInfo>? _userInfoFuture;
  String _result = '';
  bool logoutVisible = false;

  @override
  void initState() {
    super.initState();
    _userInfoFuture = _getUserInfo();
  }

  Future<TorusUserInfo> _getUserInfo() async {
    try {
      final TorusUserInfo response = await Web3AuthFlutter.getUserInfo();
      setState(() {
        _result = response.toString();
        logoutVisible = true;
      });
      return response;
    } on UserCancelledException {
      print("User cancelled.");
      throw "User cancelled";
    } on UnKnownException {
      print("Unknown exception occurred");
      throw "Unknown exception";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TorusUserInfo>(
        future: _userInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userInfo = snapshot.data!;

            return ListView(
              children: [
                Stack(
                  children: <Widget>[
                    HeaderWidget(title: Strings.profile),
                    Padding(
                      padding: const EdgeInsets.only(top: 91, left: 16, right: 16),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: CustomColors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.white,
                                      ),
                                      child: userInfo.profileImage != null
                                          ? CircleAvatar(
                                        backgroundImage: NetworkImage(userInfo.profileImage!),
                                        radius: 40,
                                      )
                                          : const Icon(
                                        Icons.person,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
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
                                    child: customTextFieldForm(
                                      context,
                                      controller: TextEditingController(text: userInfo.name),
                                      hintText: 'Enter your user name',
                                    ),
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
                                    child: customTextFieldForm(
                                      context,
                                      controller: TextEditingController(text: userInfo.email),
                                      hintText: 'Enter your email',
                                    ),
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
                                    child: customTextFieldForm(
                                      context,
                                      controller: TextEditingController(),
                                      hintText: 'Enter your mobile number',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 48),
                                    child: customButtonNew(
                                      context,
                                      'SAVE CHANGES',
                                      CustomColors.black,
                                      CustomColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(child: Text('No user information available.'));
          }
        },
      ),
    );
  }
}
