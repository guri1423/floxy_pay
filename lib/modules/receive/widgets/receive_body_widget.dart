import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ReceiveBodyWidget extends StatefulWidget {
  String address;
  ReceiveBodyWidget({super.key, required this.address});

  @override
  State<ReceiveBodyWidget> createState() => _ReceiveBodyWidgetState();
}

class _ReceiveBodyWidgetState extends State<ReceiveBodyWidget> {

  void _copyAddressToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.address));
    Fluttertoast.showToast(
      msg: 'Address copied to clipboard',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  void _shareAddress() async {
    try {
      await Share.share(
        widget.address,
        subject: 'Share Address',
      );
    } catch (e) {
      // Handle sharing error
      print('Error sharing address: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 91),
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
                Text('Receive',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.normal)),

                Container(
                  height: 227,
                  width: 220,
                  child: QrImageView(
                    data: widget.address,
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  ),
                ),

                Text('Scan address to receive payment',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(248, 248, 248, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.address,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _copyAddressToClipboard();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg_images/receive_page/copy_icon.svg',
                                  // add additional properties as needed
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _shareAddress();
                      },
                      child: SvgPicture.asset(
                        'assets/svg_images/receive_page/share_icon.svg',

                      ),
                    ),

                  ],
                ),

              ],
            ),
          )),
    );
  }

}

