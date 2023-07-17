import 'package:floxy_pay/modules/change_pin/pages/change_pin.dart';
import 'package:floxy_pay/modules/notification/pages/notification.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_one.dart';
import 'package:floxy_pay/modules/onboarding/pages/onboarding_page.dart';
import 'package:floxy_pay/modules/profile/pages/profile.dart';
import 'package:floxy_pay/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/header_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  StorageServices _storageServices = StorageServices();

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
      children: [
        Stack(children: <Widget>[
          const HeaderWidgetWithoutBackButton(title: Strings.setting),
          Padding(
              padding: const EdgeInsets.only(top: 91, left: 16, right: 16),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(bottom: 16, top: 30)
                          : const EdgeInsets.only(
                              bottom: 16,
                            ),
                      child: ListTile(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePin()),
                            );
                          } else if (index == 3) {
                            _showDialog(context);
                          }
                        },
                        leading: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color(0x19272246),
                                blurRadius: 12,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ], shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              imageList[index],
                            )),
                        title: Text(
                          pageList[index],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        trailing: const Icon(Icons.navigate_next_sharp, color: CustomColors.black),
                        splashColor: CustomColors.blueLight,
                      ),
                    );
                  },
                ),
              ))
        ]),
      ],
    ));
  }

  List<String> imageList = [
    'assets/svg_images/profileIcon.svg',
    'assets/svg_images/change_pin.svg',
    'assets/svg_images/logout_icon.svg',
    'assets/svg_images/notification_icon.svg'
  ];

  List<String> pageList = ['Profile', 'Notification', 'Change Pin', 'Logout'];

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
            content: Stack(alignment: Alignment.topRight, children: [
          Container(
            width: 280,
            height: 190,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SvgPicture.asset(
                      'assets/svg_images/pop_dialog_image.svg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Are you sure want to Logout? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          logout();
                        },
                        child: Container(
                          width: 106,
                          height: 42,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 106,
                          height: 42,
                          decoration: ShapeDecoration(
                            color:
                                Colors.black.withOpacity(0.10000000149011612),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/svg_images/close_icon.svg')),
            ],
          )
        ]));
      },
    );
  }

  logout() async {
    await Web3AuthFlutter.logout();
    await _storageServices.clearStorage();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  OnBoardingPage()),
        (route) => false);
  }

  VoidCallback _logout() {
    return () async {
      try {
        await Web3AuthFlutter.logout();
        setState(() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => OnBoardingPage()),
              (route) => false);
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }
}
