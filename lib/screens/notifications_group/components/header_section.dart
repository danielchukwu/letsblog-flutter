import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/square_image.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection(
      {Key? key, required this.type, required this.title, required this.img})
      : super(key: key);

  final String type, title, img;
  @override
  Widget build(BuildContext context) {
    // e.g 'commented_blog' =>['commented', 'blog'] => commented => Comments
    String notificationHeader = capitalize(removeED(type.split('_')[0]));

    if (type == 'follow') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(context) * 2, vertical: getSize(context) * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Text(
              'Followers',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getSize(context) * 2,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '4',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getSize(context) * 2,
                  fontWeight: FontWeight.w400),
            ),

          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Notification Type (e.g Likes, Comments, Follows)
          SizedBox(height: getSize(context) * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(context) * 2),
            child: Text(
              notificationHeader,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getSize(context) * 2,
                  fontWeight: FontWeight.w600),
            ),
          ),

          // Notification Blog (Title & Image)
          SizedBox(height: getSize(context) * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(context) * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Blog Title or Comment
                type != 'follow'
                    ? Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: getSize(context) * 1.8,
                    ),
                  ),
                )
                    : Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: getSize(context) * 1.4,
                    ),
                  ),
                ),

                // Blog Image
                SquareImage(img: img)
              ],
            ),
          ),
          SizedBox(height: getSize(context) * 2),
          getDivider(),

        ],
      );
    }
  }
}


