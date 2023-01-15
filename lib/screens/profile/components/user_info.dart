import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/screens/follows/follows_screen.dart';


class userInfo extends StatefulWidget {
  const userInfo({Key? key, required this.user}) : super(key: key);

  final Map user;

  @override
  State<userInfo> createState() => _userInfoState(user: user);
}

class _userInfoState extends State<userInfo> {
  _userInfoState({required this.user});
  final Map user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(
            widget.user['name'].toUpperCase(),
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.9),
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
          // username
          SizedBox(height: 5),
          Text(
            "@${widget.user['username']}",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.5),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          // occupation & company
          SizedBox(height: 10),
          Text(
            "${widget.user['occupation']} at ${widget.user['company']}",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.5),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          // Following & Followers
          SizedBox(height: 10),
          buildFollowersFollowing(),
        ],
      ),
    );
  }

  Row buildFollowersFollowing() {
    return Row(
      children: [
        // Followers
        // count
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                FollowsScreen.routeName,
                arguments: {
                  'selectedIndex': 0,  // means => followers
                }
            );
          },
          child: Text(
            // Following
            // count
            "${widget.user['followers_count']} ",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.8),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        // text
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                FollowsScreen.routeName,
                arguments: {
                  'selectedIndex': 0,  // means => followers
                }
            );
          },
          child: Text(
            "followers",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.5),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),

        // dot
        Container(
          height: 8,
          width: 8,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: KBlack.withOpacity(.8)),
        ),

        // Following
        // count
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                FollowsScreen.routeName,
                arguments: {
                  'selectedIndex': 1,  // means => following
                }
            );
          },
          child: Text(
            "${widget.user['following_count']} ",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.8),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        // text
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                FollowsScreen.routeName,
                arguments: {
                  'selectedIndex': 1,  // means => following
                }
            );
          },
          child: Text(
            "following",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000).withOpacity(.5),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
