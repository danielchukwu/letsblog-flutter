import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/components/bottom_navbar.dart';
import 'package:letsblog_flutter/models/ProfileNavbarItem.dart';
import 'package:letsblog_flutter/screens/profile/components/about_section.dart';
import 'package:letsblog_flutter/screens/profile/components/blog_section.dart';
import 'package:letsblog_flutter/screens/profile/components/contact_section.dart';
import 'package:letsblog_flutter/screens/profile/components/profile_navbar.dart';
import 'package:letsblog_flutter/screens/profile/components/user_cover_avatar.dart';
import 'package:letsblog_flutter/screens/profile/components/user_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // set profile navbar to blogs when profile is first opened
  _ProfileScreenState() {
    ProfileNavbarItems.setSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    Map user = ModalRoute.of(context)!.settings.arguments as Map;
    void updateFollowersCount() {
      setState(() {
        if (user['followers_count'] >= 0) {
          if (user['is_following'] == true) {
            user['followers_count']++;
          } else {
            user['followers_count']--;
          }
        }
      });
    };

    return Scaffold(
      appBar: buildAppBar(user),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Cover, Avatar, Edit Profile Button
            UserCoverAvatarEdit(avatar: user['avatar'], cover: user['cover'], user: user, pressUpdateFollowersCount: updateFollowersCount),

            // Name, Username, Occupation and Company, Following & Followers
            userInfo(user: user),

            // ProfileNavBarList
            ProfileNavbar(press: (index) {
              setState(() {
                ProfileNavbarItems.setSelectedIndex(index);
              });
            }),

            // Blog Section
            BlogSection(user: user),

            // About & Skills
            AboutSection(user: user),

            // Socials
            ContactSection(user: user),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(showNavbar: user['id'] == 1),
    );
  }

  PreferredSize buildAppBar(Map<dynamic, dynamic> user) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(showBackButton: user['id'] != 1),
    );
  }
}


