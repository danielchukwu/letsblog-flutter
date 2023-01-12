import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/buttons.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/SearchNavbarItem.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/search/components/double_navbar.dart';
import 'package:letsblog_flutter/screens/search/components/username_name.dart';
import 'package:letsblog_flutter/utils.dart';

class FollowsScreen extends StatelessWidget {
  const FollowsScreen({Key? key}) : super(key: key);

  static String routeName = '/follows';
  @override
  Widget build(BuildContext context) {
    // Grab the arguments passed to this screen using ModalRoute.of(...)
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    
    // Set Navbar items to the ones for search 'User' and 'Blog' 
    DoubleNavbarItems.items = DoubleNavbarItems.navFollowItems;
    DoubleNavbarItems.selectedIndex = data['selectedIndex'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppBar(showBackButton: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Show Double Navbar for 'followers' and 'following'
            DoubleNavbar(press: () {}, top: 20, bottom: 20),

            // Follows Body
            // FollowsBody(),
            FollowsBody()
          ],

        ),
      ),
    );
  }
}

class FollowsBody extends StatelessWidget {
  const FollowsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
        userItems.length,
        (index) => UserFollowsCard(data: {
          'avatar': userItems[index].avatar,
          'username': userItems[index].username,
          'name': userItems[index].name,
          'is_following': userItems[index].is_following,
        },)),
    );
  }
}


class UserFollowsCard extends StatelessWidget {
  const UserFollowsCard({Key? key, required this.data}) : super(key: key);

  final Map data;
  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // User Avatar
          SingleRoundAvatar(avatarUrl: data['avatar']),
          SizedBox(width: 15),

          // Username & name
          UsernameName(name: data['username'], username: capitalize(data['name']), screen_name: 'follows_screen'),

          // Follow Button
          FollowButton(data: data),

        ],
      ),
    );
  }
}


