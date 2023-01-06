import 'package:flutter/material.dart';
import 'package:letsblog_flutter/models/Navbar.dart';
import 'package:letsblog_flutter/screens/blog/blog_screen.dart';
import 'package:letsblog_flutter/screens/create_blog/create_blog_screen.dart';
import 'package:letsblog_flutter/screens/edit_profile/edit_profile_screen.dart';
import 'package:letsblog_flutter/screens/follows/follows_screen.dart';
import 'package:letsblog_flutter/screens/home/home_screen.dart';
import 'package:letsblog_flutter/screens/loading.dart';
import 'package:letsblog_flutter/screens/manage_blogs/manage_blogs_screen.dart';
import 'package:letsblog_flutter/screens/notifications/notifications_screen.dart';
import 'package:letsblog_flutter/screens/notifications_group/notifications_group_screen.dart';
import 'package:letsblog_flutter/screens/profile/profile_screen.dart';
import 'package:letsblog_flutter/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LetsBlog',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            toolbarHeight: 60,
            elevation: 0
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            elevation: 1,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/': (context) => LoadingScreen(),
          '/home': (context) => HomeScreen(),
          '/blogs': (context) => BlogScreen(),
          '/profile': (context) => ProfileScreen(),
          '/notifications': (context) => NotificationsScreen(),
          '/notification-group': (context) => NotificationGroupScreen(),
          '/search': (context) => SearchScreen(),
          '/follows': (context) => FollowsScreen(),
          '/create-blog': (context) => CreateBlogScreen(),
          '/manage-blogs': (context) => ManageBlogsScreen(),
          '/edit-profile': (context) => EditProfileScreen(),
        },
      ),
    );
  }
}
