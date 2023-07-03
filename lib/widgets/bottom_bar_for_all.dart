



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/bottom_navigation/bloc/bottom_navigation_cubit.dart';
import '../modules/bottom_navigation/bloc/bottom_navigation_state.dart';
import '../modules/bottom_navigation/constant/items.dart';
import '../modules/bottom_navigation/pages/bottom_navigation.dart';

class BottomToolsForInsidePage extends StatelessWidget {
  const BottomToolsForInsidePage({Key? key, this.onBackPress})
      : super(key: key);
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: BottomAppBar(
              elevation: 30,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      if (onBackPress != null) {
                        onBackPress!.call();
                      } else {
                        Navigator.pop(context);
                        /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()));*/
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.Home);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: state.index == 0
                              ? Image.asset(
                            "assets/images/updated_images/013-back.png",
                          )
                              : Image.asset("assets/images/updated_images/013-back.png"),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigation()));
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.Home);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: state.index == 1
                              ? Image.asset("assets/images/updated_images/014-menu.png")
                              : Image.asset("assets/images/updated_images/014-menu.png"),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigation()));
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.History);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: state.index == 2
                              ? Image.asset(
                            "assets/images/updated_images/016-user.png",
                          )
                              : Image.asset("assets/images/updated_images/016-user.png"),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigation()));
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.Setting);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: state.index == 3
                              ? Image.asset(
                            "assets/images/updated_images/015-settings.png",
                          )
                              : Image.asset("assets/images/updated_images/015-settings.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}