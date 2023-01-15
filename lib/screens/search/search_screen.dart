import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/bottom_navbar.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/SearchNavbarItem.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/search/components/double_navbar.dart';
import 'package:letsblog_flutter/screens/search/components/search_body.dart';
import 'package:letsblog_flutter/screens/search/components/search_form.dart';
import 'package:letsblog_flutter/utils.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  static String routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List searchResults;

  @override
  Widget build(BuildContext context) {
    // Set Navbar items to the ones for search 'User' and 'Blog'
    DoubleNavbarItems.items = DoubleNavbarItems.navFollowItems;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Search Form
              SearchForm(
                  press: (newData) => setState(() => searchResults = newData)),

              // Search Navbar
              DoubleNavbar(
                  press: (index) =>
                      setState(() => DoubleNavbarItems.selectedIndex = index)),

              // Search Results
              SearchBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}