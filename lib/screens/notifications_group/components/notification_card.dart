import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/utils.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required this.data, required this.appendText}) : super(key: key);

  final Map data;
  final String appendText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Notification - User Avatar and Notification Text
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Notification avatar
              SingleRoundAvatar(avatarUrl: data['avatar']),
              SizedBox(width: 15),

              // Notification Text
              Container(
                // color: Colors.green,
                width: data['blog_img'] != null
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
                              text: data['username'], style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500,),
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

                            // add grouping text
                            TextSpan(text: appendText)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
