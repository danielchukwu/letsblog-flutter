import 'package:flutter/material.dart';
import 'package:letsblog_flutter/screens/create_blog/create_blog_screen.dart';
import 'package:letsblog_flutter/screens/home/home_screen.dart';
import 'package:letsblog_flutter/screens/notifications/notifications_screen.dart';
import 'package:letsblog_flutter/screens/profile/profile_screen.dart';
import 'package:letsblog_flutter/screens/search/search_screen.dart';

class NavItem {
  final int id;
  final String icon;
  final String destination;

  NavItem({required this.id, required this.icon, required this.destination});
}

class NavItems extends ChangeNotifier {
  int previousIndex = 0;
  int selectedIndex = 0;

  void changeNavbar (int index) {
    previousIndex = selectedIndex;
    selectedIndex = index;

    notifyListeners();
  }

  bool isNewNavbar () => previousIndex != selectedIndex;
  void changeBackToPreviousNavbar () {
    selectedIndex = previousIndex;
  }

  List<NavItem> items = [
    NavItem(id: 0, icon: "assets/icons/home.svg", destination: HomeScreen.routeName),
    NavItem(id: 1, icon: "assets/icons/search-icon.svg", destination: SearchScreen.routeName),
    NavItem(id: 2, icon: "assets/icons/plus-solid.svg", destination: CreateBlogScreen.routeName),
    NavItem(id: 3, icon: "assets/icons/notification.svg", destination: NotificationsScreen.routeName),
    NavItem(id: 4, icon: "assets/icons/user-solid.svg", destination: ProfileScreen.routeName),
  ];
}