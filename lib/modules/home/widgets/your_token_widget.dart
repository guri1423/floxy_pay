import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/handler/ether_scan_my_token.dart';
import 'package:floxy_pay/modules/handler/main_net.dart';
import 'package:floxy_pay/modules/handler/polygon_eth_handler.dart';
import 'package:flutter/material.dart';

class YourTokenWidget extends StatefulWidget {
  const YourTokenWidget({super.key});

  @override
  State<YourTokenWidget> createState() => _YourTokenWidgetState();
}

class _YourTokenWidgetState extends State<YourTokenWidget> {
  final balanceHandler = BalanceHandler();
  final polyHandler = PolyHandler();
  final sendHandler = SendBalanceHandler();

  String? balance = '0';
  String? polyBalance ='0';
  String? sendBalance ='0';

/*  Future<dynamic> getBal(){

    dynamic val
  }*/

  @override
  void initState() {

    balanceHandler.getBalance1().then((String bal) {
      double dividedBalance = double.parse(bal) / 1000000;
      setState(() {
        balance = dividedBalance.toString();
      });
    });

    sendHandler.getBalance1().then((String bal) {
      double dividedBalance = double.parse(bal) / 1000000000000000000;
      // NumberFormat formatter = NumberFormat.compact(); // Creates a formatter
      double formattedBalance = dividedBalance; // Formats the number
      setState(() {
        sendBalance = formattedBalance.toString();
      });
    });

    polyHandler.getBalance1().then((String balance) {
      double dividedBalance = double.parse(balance) / 1000000;
      setState(() {
        polyBalance = dividedBalance.toString();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;


    YourTokens.allYourTokens = [
      YourTokens(
          title: "Tether USD",
          value: "${balance} USDT",
          iconSrc: "assets/svg_images/bitcoin.svg",
          netProfit: "+2.49%",
          subTitle: "Ethereum  USDT",
          bgColor: CustomColors.token1),
      YourTokens(
          title: "Tether USD",
          value: "${polyBalance} USDT",
          iconSrc: "assets/svg_images/eth.svg",
          netProfit: "+2.49%",
          subTitle: "Polygon  USDT",
          bgColor: CustomColors.token2),
      YourTokens(
          title: "MyTokenSymbol",
          value: "${sendBalance} MyTokenSymbol",
          iconSrc: "assets/svg_images/bitcoin.svg",
          netProfit: "+2.49%",
          subTitle: "Sepolia Ethereum Testnet  MyTokenSymbol",
          bgColor: CustomColors.token3),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Your Tokens",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              DotsIndicator(dotsCount: 3)
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          // width: size.width,
          height: 260,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: YourTokens.allYourTokens.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20)
                      : EdgeInsets.zero,
                  child: Container(
                    decoration: BoxDecoration(
                        color: YourTokens.allYourTokens[index].bgColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 48,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          YourTokens.allYourTokens[index].title,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          YourTokens.allYourTokens[index].subTitle,
                          style: theme.textTheme.titleSmall!
                              .copyWith(color: CustomColors.subTitleColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: CustomColors.white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Center(
                            child: Text(
                              YourTokens.allYourTokens[index].netProfit,
                              style: theme.textTheme.titleSmall!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            /*SvgPicture.asset(
                                YourTokens.allYourTokens[index].iconSrc),*/
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              YourTokens.allYourTokens[index].value,
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(color: CustomColors.subTitleColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

}

class YourTokens {
  final String title;
  final String subTitle;
  final String value;
  final String netProfit;
  final String iconSrc;
  final Color bgColor;

  YourTokens({
    required this.title,
    required this.value,
    required this.iconSrc,
    required this.netProfit,
    required this.subTitle,
    required this.bgColor,
  });

  static List<YourTokens> allYourTokens = [];
}



