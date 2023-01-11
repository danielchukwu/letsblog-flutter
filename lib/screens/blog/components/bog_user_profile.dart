import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/buttons.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Avatar-Username-Follow
        children: [
          // avatar-username
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              '/profile',
              arguments: {
                'id' : userItems[1].id,
                'cover': userItems[1].cover,
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
              },
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: KPrimaryColor,
                  backgroundImage: NetworkImage("$cloudinary_host${data['avatar']}"),
                ),
                SizedBox(width: 10),
                Text(
                  data['username'],
                  style: TextStyle(
                      color: KBlack.withOpacity(.8),
                      fontFamily: 'Poppins',
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 10)
              ],
            ),
          ),
          // follow
          FollowButton(data: data),
        ],
        // Follow
      ),
    );
  }
}