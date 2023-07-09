import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/buy_fxy/pages/buy_fxy.dart';
import 'package:floxy_pay/modules/notification/pages/notification.dart';
import 'package:floxy_pay/modules/profile/pages/profile.dart';
import 'package:floxy_pay/modules/sale/pages/sale.dart';
import 'package:floxy_pay/modules/swap/pages/swap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import '../../receive/pages/receive_page.dart';
import '../../send/pages/send.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  @override
  void initState() {
    _getBalance();
    super.initState();
  }

  String rpcUrl = 'https://rpc.ankr.com/eth';

  String _result = '';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Container(
          decoration: const BoxDecoration(
            color: CustomColors.blueLight,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),

              bottomRight: Radius.circular(20), // Adjust radiusValue as needed
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: CustomColors.white),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      },
                      child: SvgPicture.asset(
                        'assets/svg_images/notificationImage.svg',
                        height: 28,
                        width: 28,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_result}",
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Text(
                                    "-2.49%",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("+67.53%",
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.w400)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyFxy()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Center(
                              child: Text(
                                "Buy FXY",
                                style: theme.textTheme.headlineSmall!.copyWith(
                                    color: CustomColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
                // thirdRow(context)
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x193D566E),
                blurRadius: 12,
                offset: Offset(0, 3),
                spreadRadius: -2,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SendPage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/sendButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Receive()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/receiveButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SwapPage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/swapButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SalePage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/saleButton.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Future<EtherAmount> _getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    final balance = await client.getBalance(address);
    debugPrint(balance.toString());

    setState(() {
      _result = balance.toString();
    });

    return balance;
  }
}
