import 'package:dots_indicator/dots_indicator.dart';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/home/model/recommended_file.dart';
import 'package:flutter/material.dart';

class RecommendedToBuyWidget extends StatelessWidget {
  const RecommendedToBuyWidget({Key? key}) : super(key: key);

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
                  "Recommend to Buy",
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
          height: 260,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: RecommendedToBuy.allRecommendation.length,
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
                      color: RecommendedToBuy.allRecommendation[index].bgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 60,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          RecommendedToBuy.allRecommendation[index].title,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          RecommendedToBuy.allRecommendation[index].subTitle,
                          style: theme.textTheme.bodyMedium!
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
                            child: Text(RecommendedToBuy
                                .allRecommendation[index].netProfit),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              RecommendedToBuy.allRecommendation[index].value,
                              style: theme.textTheme.titleMedium!.copyWith(
                                  color: CustomColors.subTitleColor,
                                  fontSize: 14),
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
