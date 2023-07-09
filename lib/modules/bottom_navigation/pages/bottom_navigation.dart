import 'package:floxy_pay/modules/deposit/pages/deposit.dart';
import 'package:floxy_pay/modules/history/pages/history.dart';
import 'package:floxy_pay/modules/settings/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../home/pages/home.dart';
import '../bloc/bottom_navigation_cubit.dart';
import '../bloc/bottom_navigation_state.dart';
import '../constant/items.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.Home) {
          return const HomePage();
        } else if (state.navbarItem == NavbarItem.History) {
          return const HistoryPage();
        } else if (state.navbarItem == NavbarItem.Deposit) {
          return const DepositPage();
        } else if (state.navbarItem == NavbarItem.Setting) {
          return const SettingsPage();
        }

        return Container();
      }),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: BottomAppBar(
              elevation: 30,
              color: CustomColors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.Home);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              state.index == 0
                                  ? CustomColors.white
                                  : CustomColors.grey,
                              BlendMode.srcIn,
                            ),
                            child: SvgPicture.asset(
                                'assets/svg_images/bottom_navigation_images/172631_wallet_icon 1_white.svg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.History);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                state.index == 1
                                    ? CustomColors.white
                                    : CustomColors.grey,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                  'assets/svg_images/bottom_navigation_images/history_white.svg')),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.Deposit);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                state.index == 2
                                    ? CustomColors.white
                                    : CustomColors.grey,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                  'assets/svg_images/bottom_navigation_images/8333969_deposit_money_bank_salary_saving_icon_white.svg')),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.Setting);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                state.index == 3
                                    ? CustomColors.white
                                    : CustomColors.grey,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                  'assets/svg_images/bottom_navigation_images/Settings adjust__white.svg')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
