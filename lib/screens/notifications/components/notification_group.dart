import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/Notifications.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';

class NotificationGroup extends StatelessWidget {
  const NotificationGroup(
      {Key? key,
        required this.type,
        required this.group,
        this.showDivider = false})
      : super(key: key);

  final String type, group;
  final bool showDivider;
  final String cloudinary_host = "https://api.cloudinary.com/v1_1/dhtcwqsx4/image/upload/";


  @override
  Widget build(BuildContext context) {
    Widget getDivider() {
      if (type == 'seen' ||
          type == 'unseen' && notificationsData['seen'][group].length == 0) {
        return Divider(height: 0, color: KBlack.withOpacity(.1), thickness: 1);
      }
      return SizedBox();
    }

    // Type  => seen | unseen
    // Group => today, yesterday, this_week, this_month, last_month, this_year, old
    if (notificationsData[type][group].length == 0) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Group Divider
        getDivider(),
        // Group title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            capitalize(group.replaceAll('_', ' ')),
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: KBlack.withOpacity(.8)),
          ),
        ),
        // Group Notifications
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
              notificationsData[type][group].length,
                  (index) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    // notificationsData[type][group][index].length == 1
                    //     ? buildSingleRoundAvatar()
                    //     : buildDoubleRoundAvatar(),
                    // SizedBox(width: 15),
                    // Text('data'),
                    getNotification(context, notificationsData[type][group][index])
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
    print('data');
    print(data);

    Widget generateRow(String text){
      TextStyle boldTextStyle = TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500);
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // Notification Avatar & Text
            Row(
              children: [
                // Notification avatar
                data.length == 1 ? buildSingleRoundAvatar(data[0]['avatar']) : buildDoubleRoundAvatar(data[0]['avatar'], data[1]['avatar']),
                SizedBox(width: 15),

                // Notification Text
                Container(
                  // color: Colors.green,
                  width: data[0]['blog_img'] != null
                      ? MediaQuery.of(context).size.width - 170
                      : MediaQuery.of(context).size.width - 105,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: [

                      // leading username
                      Text(data[0]['username'], style: boldTextStyle,),

                      // add 'and' seperator if only 2 notifications in notifications List
                      data.length == 2
                        ? Text(' and ', style: TextStyle(fontFamily: 'Poppins'))
                        : SizedBox(),

                      // add ', ' seperator if only notificationList has more than 2 followers
                      data.length >= 3
                        ? Text(', ', style: TextStyle(fontFamily: 'Poppins'))
                        : SizedBox(),

                      // add 2nd leading username if notification List has 2 or more notifications
                      data.length >= 2
                        ? Text(data[1]['username'], style: boldTextStyle)
                        : SizedBox(),

                      // add 'and _ others' if notification List has 3 or more notifications
                      data.length >= 3
                        ? Text(' and ${data.length-2} others', style: TextStyle(fontFamily: 'Poppins'))
                        : SizedBox(),

                      // add grouping text
                      Text(text, style: TextStyle(fontFamily: 'Poppins'),),
                    ],
                  ),
                ),
              ],
            ),

            // Notification Blog Image -> if any
            data[0]['blog_img'] != null
              ? Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: KBlack.withOpacity(.2),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://api.cloudinary.com/v1_1/dhtcwqsx4/image/upload/${data[0]['blog_img']}'
                  )
                )
              ),
            )
              : SizedBox(),
          ],
        ),
      );
    }

    switch(data[0]['type']) {
      case('follow'):
        return generateRow(' started following you.');
      case('liked_blog'):
        return generateRow(' liked your blog.');
      case('liked_comment'):
        return generateRow(' liked your comment.');
      case('commented_blog'):
        return generateRow(' commented on your blog.');
      case('commented_comment'):
        return generateRow(' commented on your comment.');
      default:
        return SizedBox();
    }
  }

  Widget buildSingleRoundAvatar(String avatarUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: KBlack.withOpacity(.2),
        image: DecorationImage(
          image: NetworkImage('${cloudinary_host}${avatarUrl}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildDoubleRoundAvatar(String avatarUrl, String avatarUrlBehind) {
    return Stack(
      children: [
        // Stack Size
        Container(width: 50, height: 50),

        // Image Behind
        Positioned(
          width: 38,
          height: 38,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: KBlack.withOpacity(.2),
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                  image: NetworkImage('${cloudinary_host}${avatarUrlBehind}'),
                  fit: BoxFit.cover,
                )),
          ),
        ),

        // Image In Front
        Positioned(
          width: 40, height: 40,
          right: 0, bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: KBlack.withOpacity(.2),
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                  image: NetworkImage('${cloudinary_host}${avatarUrl}'),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    );
  }
}
