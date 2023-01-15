import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/single_avatar.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/search/components/username_name.dart';
import 'package:letsblog_flutter/utils.dart';


// User Search Card
class UserSearchCard extends StatelessWidget {
  const UserSearchCard({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Notification avatar
          SingleRoundAvatar(avatarUrl: data['avatar']),
          SizedBox(width: 15),

          // Notification Username & name
         UsernameName(username: data['username'], name: data['name']),

          // Blog Count
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "${data['blog_count']}",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: KBlack.withOpacity(.8)),
                ),
                Text(
                  'blogs',
                  style: TextStyle(
                      fontFamily: 'Poppins', color: KBlack.withOpacity(.6)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}