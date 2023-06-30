

import 'package:equatable/equatable.dart';

import '../constant/items.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  NavigationState(this.navbarItem, this.index);



  @override
  List<Object> get props => [this.navbarItem, this.index];
}