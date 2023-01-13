import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';


class NotificationText extends StatelessWidget {
  NotificationText({Key? key, required this.data, required this.appendText}) : super(key: key);

  final List data;
  final String appendText;
  final boldTextStyle = TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      width: data[0]['blog_img'] != null
          ? MediaQuery.of(context).size.width - 170
          : MediaQuery.of(context).size.width - 105,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        children: [
          // Notification Avatar & Text
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/notification-group',
                  arguments: data
              );
            },
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                    fontFamily: 'Poppins', color: KBlack.withOpacity(.8)),
                children: [
                  // username
                  TextSpan(
                    text: data[0]['username'], style: boldTextStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context,
                            '/profile',
                            arguments: {
                              'id' : userItems[2].id,
                              'cover' : userItems[2].cover,
                              'avatar' : userItems[2].avatar,
                              'username' : userItems[2].username,
                              'name' : userItems[2].name,
                              'occupation' : userItems[2].occupation,
                              'company' : userItems[2].company,
                              'followers_count' : userItems[2].followers_count,
                              'following_count' : userItems[2].following_count,
                              'is_following' : userItems[2].is_following,
                              'about' : userItems[2].about,
                              'skills' : userItems[2].skills,
                              'instagram' : userItems[2].instagram,
                              'twitter' : userItems[2].twitter,
                              'facebook' : userItems[2].facebook,
                              'website' : userItems[2].website,
                              'linkedin' : userItems[2].linkedin,
                              'youtube' : userItems[2].youtube,
                            }
                        );
                      },
                  ),

                  // 'and' for only 2 notifications List in notifications List
                  TextSpan(text: data.length == 2 ? ' and ' : ''),

                  // ', ' for notifications List with more than 2 followers
                  TextSpan(text: data.length >= 3 ? ', ' : ''),

                  // another username if notifications List has 2 or more notifications
                  TextSpan(
                    text: data.length >= 2 ? data[1]['username'] : '',
                    style: boldTextStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context,
                            '/profile',
                            arguments: {
                              'id' : userItems[1].id,
                              'cover' : userItems[1].cover,
                              'avatar' : userItems[1].avatar,
                              'username' : userItems[1].username,
                              'name' : userItems[1].name,
                              'occupation' : userItems[1].occupation,
                              'company' : userItems[1].company,
                              'followers_count' : userItems[1].followers_count,
                              'following_count' : userItems[1].following_count,
                              'is_following' : userItems[1].is_following,
                              'about' : userItems[1].about,
                              'skills' : userItems[1].skills,
                              'instagram' : userItems[1].instagram,
                              'twitter' : userItems[1].twitter,
                              'facebook' : userItems[1].facebook,
                              'website' : userItems[1].website,
                              'linkedin' : userItems[1].linkedin,
                              'youtube' : userItems[1].youtube,
                            }
                        );
                      },
                  ),

                  // 'and _ others' if notification List has 3 or more notifications
                  TextSpan(
                      text: data.length >= 3
                          ? ' and ${data.length - 2} others'
                          : ''),

                  // add grouping text
                  TextSpan(text: appendText)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}