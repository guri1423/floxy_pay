import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveBodyWidget extends StatelessWidget {
  const ReceiveBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Container(
          decoration: const BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Receive'),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 18),
                  child: Container(
                    height: 227,
                    width: 220,
                    decoration: BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.circular(16)),

                    child: QrImage(
                      data: 'This is a simple QR code',
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false,
                    )
                  ),
                ),
                const Text('Scan address to receive payment'),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(248, 248, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Row(
                          children: const [
                            Text('ewh37vfumf........xd2'),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
