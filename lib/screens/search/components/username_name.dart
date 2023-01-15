import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';

// This widget will mostly be used in our search_screen or follows_screen to
// display the Username and Name of users
class UsernameName extends StatelessWidget {
  const UsernameName({
    Key? key,
    this.screen_name = 'search_screen', // can either be 'search_screen' or 'follows_screen'
    required this.username,
    required this.name,
  }) : super(key: key);

  // We will be using this screen_name variable to adjust
  // the width of this widget
  final String screen_name;
  final String username;
  final String name;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/profile', arguments: {
          'id': userItems[2].id,
          'cover': userItems[2].cover,
          'avatar': userItems[2].avatar,
          'username': userItems[2].username,
          'name': userItems[2].name,
          'occupation': userItems[2].occupation,
          'company': userItems[2].company,
          'followers_count': userItems[2].followers_count,
          'following_count': userItems[2].following_count,
          'is_following': userItems[2].is_following,
          'about': userItems[2].about,
          'skills': userItems[2].skills,
          'instagram': userItems[2].instagram,
          'twitter': userItems[2].twitter,
          'facebook': userItems[2].facebook,
          'website': userItems[2].website,
          'linkedin': userItems[2].linkedin,
          'youtube': userItems[2].youtube,
        });
      },
      child: Container(
        width: screen_name == 'search_screen'
          ? MediaQuery.of(context).size.width - 160
          : MediaQuery.of(context).size.width - 250,
        margin: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Username
            Text(username,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: ds * 1.6,
                  color: KBlack.withOpacity(.8)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // Name
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KBlack.withOpacity(.6)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}