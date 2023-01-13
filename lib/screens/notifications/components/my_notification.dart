import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/square_image.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/Notifications.dart';
import 'package:letsblog_flutter/screens/notifications/components/double_avatar.dart';
import 'package:letsblog_flutter/screens/notifications/components/notification_text.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/utils.dart';


class MyNotification extends StatelessWidget {
  const MyNotification(
      {Key? key,
      required this.type,
      required this.period,
      this.showDivider = false})
      : super(key: key);

  final String type, period;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    Widget getDivider() {
      if (type == 'seen' ||
          type == 'unseen' && notificationsData['seen'][period].length == 0) {
        return Divider(height: 0, color: KBlack.withOpacity(.1), thickness: 1);
      }
      return SizedBox();
    }

    // Type  => seen | unseen
    // Period => today, yesterday, this_week, this_month, last_month, this_year, old
    if (notificationsData[type][period].length == 0) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Period Divider
        getDivider(),
        // Period title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            capitalize(period.replaceAll('_', ' ')),
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: KBlack.withOpacity(.8)),
          ),
        ),
        // Period Notifications
        Padding(
          // type => seen or unseen | period => today, yesterday ...
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
              notificationsData[type][period].length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    getNotification(context, notificationsData[type][period][index])
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getNotification(context, data) {
    // Widget to be returned
    Widget generateRow(String appendText) {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Notification - User Avatar and Notification Text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Notification avatar
                data.length == 1
                    ? SingleRoundAvatar(avatarUrl: data[0]['avatar'])
                    : DoubleAvatar(avatarUrl: data[0]['avatar'], avatarUrlBehind: data[1]['avatar']),

                // Notification Text
                SizedBox(width: 15),
                NotificationText(data: data, appendText: appendText),

              ],
            ),

            // Notification Blog Image -> if any
            data[0]['blog_img'] != null
                ? SquareImage(img: data[0]['blog_img'])
                : SizedBox(),
          ],
        ),
      );
    }

    return generateRow(getAppendText(type: data[0]['type']));
  }
}



