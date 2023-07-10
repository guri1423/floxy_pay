import 'package:floxy_pay/modules/buy_fxy/pages/payment_success.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/header_without_backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/colors.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(children: <Widget>[
          const HeaderWithoutBack(),
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
                      padding: EdgeInsets.only(left: 15, top: 30, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'INR 100.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF7931A),
                              fontSize: 24,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Container(
                              width: 149,
                              height: 144,
                              child: QrImageView(
                                data: 'This is a simple QR code',
                                version: QrVersions.auto,
                                size: 320,
                                gapless: false,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              'Scan to pay',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(248, 248, 248, 1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ajanta20@rbl',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                            'assets/svg_images/receive_page/copy_icon.svg')
                                      ],
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                    'assets/svg_images/download_payment.svg')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _imageList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        initSelectedVal = index;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio<int>(
                                          value: index,
                                          groupValue: initSelectedVal,
                                          onChanged: (int? value) {
                                            setState(() {
                                              initSelectedVal = value!;
                                            });
                                          },
                                          visualDensity: const VisualDensity(
                                              horizontal: 0, vertical: 0),
                                        ),
                                        SvgPicture.asset(
                                          _imageList[index],
                                          height: 20,
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 4,
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )
        ]),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 84, right: 84),
            child: customButtonLast(context, 'CANCEL PAYMENT',
                Color.fromRGBO(0, 0, 0, 0.10), CustomColors.black),
          ),
        )
      ]),
    );
  }

  int initSelectedVal = 0;
  final List<String> _imageList = const [

    'assets/svg_images/google-pay 1.svg',
    'assets/svg_images/Paytm_Logo_(standalone) 1.svg',
    'assets/svg_images/image 7.svg',
    'assets/svg_images/image 8.svg',
  ];
}
