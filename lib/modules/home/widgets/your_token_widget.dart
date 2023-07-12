


import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/handler/main_net.dart';
import 'package:floxy_pay/modules/home/model/token_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourTokenWidget extends StatefulWidget {
  const YourTokenWidget({super.key});

  @override
  State<YourTokenWidget> createState() => _YourTokenWidgetState();
}

class _YourTokenWidgetState extends State<YourTokenWidget> {

  final balanceHandler = BalanceHandler();

  @override
  void initState() {

    balanceHandler.getBalance1();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
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
                            child:
                            Text(YourTokens.allYourTokens[index].netProfit,
                              style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(YourTokens.allYourTokens[index].iconSrc),
                            const SizedBox(width: 4,),
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

