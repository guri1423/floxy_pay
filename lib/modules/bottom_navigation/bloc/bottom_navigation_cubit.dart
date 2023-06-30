import 'package:bloc/bloc.dart';

import '../constant/items.dart';
import 'bottom_navigation_state.dart';




class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.Home,0));

  void getNavBarItem(NavbarItem navbarItem){
    switch (navbarItem){
      case NavbarItem.Home:
        emit(NavigationState(NavbarItem.Home, 0));
        break;
      case NavbarItem.History:
        emit(NavigationState(NavbarItem.History, 1));
        break;
      case NavbarItem.Deposit:
        emit(NavigationState(NavbarItem.Deposit, 2));
        break;
      case NavbarItem.Setting:
        emit(NavigationState(NavbarItem.Setting, 3));
        break;


    }
  }
}