import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/bottom_navbar.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/Notifications.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/notifications/components/my_notification.dart';

// Capitalizes any string passed into it

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static String routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            // Today
            // unseen
            MyNotification(type: 'unseen', period: 'today'),
            // seen
            MyNotification(type: 'seen', period: 'today'),

            // Yesterday
            // unseen
            MyNotification(type: 'unseen', period: 'yesterday'),
            // seen
            MyNotification(type: 'seen', period: 'yesterday'),

            // this_week
            // unseen
            MyNotification(type: 'unseen', period: 'this_week'),
            // seen
            MyNotification(type: 'seen', period: 'this_week'),

            // this_month
            // unseen
            MyNotification(type: 'unseen', period: 'this_month'),
            // seen
            MyNotification(type: 'seen', period: 'this_month'),

            // last_month
            // unseen
            MyNotification(type: 'unseen', period: 'last_month'),
            // seen
            MyNotification(type: 'seen', period: 'last_month'),

            // this_year
            // unseen
            MyNotification(type: 'unseen', period: 'this_year'),
            // seen
            MyNotification(type: 'seen', period: 'this_year'),

            // old
            // unseen
            MyNotification(type: 'unseen', period: 'old'),
            // seen
            MyNotification(type: 'seen', period: 'old'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

PreferredSize buildAppBar() {
  return const PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: MainAppBar(title: 'Notifications', leadingIcon: 'assets/icons/notification.svg', showBackButton: false),
  );
}