import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/blog_card/category_views.dart';
import 'package:letsblog_flutter/components/square_image.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/utils.dart';


// Blog Search Card
class BlogSearchCard extends StatelessWidget {
  const BlogSearchCard({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Blog Title and username
          GestureDetector(
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
              width: MediaQuery.of(context).size.width - 105,
              margin: EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data['title'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: ds * 1.6,
                      color: KBlack.withOpacity(.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data['username'],
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KBlack.withOpacity(.6)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),

          // Blog Image and Views
          Container(
            height: 70,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SquareImage(img: data['cover'], width: ds*4.9, height: ds*4.7),
                BlogTextIcon(text: '${data['views_count']}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
