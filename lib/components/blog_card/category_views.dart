import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/models/Notifications.dart';
import 'package:letsblog_flutter/screens/create_blog/create_blog_screen.dart';


class BlogCategorySection extends StatelessWidget {
  const BlogCategorySection({
    Key? key,
    required String this.title,
    required int this.views_count,
    bool this.showEditDeleteOption = false,
    this.pressDelete,
    this.parentContext,
  }) : super(key: key);

  final String title;
  final int views_count;
  final bool showEditDeleteOption;
  // This function contains a pop option that asks a user
  // if they are certain they want to go ahead and delete their
  final pressDelete;
  // This variable holds the parent context we want to actual display the popup
  final parentContext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Category
        Text(
          title,
          style: const TextStyle(
            letterSpacing: 6,
            fontFamily: 'Poppins',
            height: 1,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: KPrimaryColor,
          ),
        ),

        Spacer(),

        // Views Count or Edit/Delete IconButtons
        !showEditDeleteOption
            ? BlogTextIcon(text: '$views_count', spaceBetween: 10,)
            : Row(
          children: <Widget>[
            // Edit Icon Button
            InkWell(
            onTap: () {
                Navigator.of(context).pushNamed(
                  CreateBlogScreen.routeName,
                  arguments: {
                    'img': blogItems[0].cover,
                    'title': blogItems[0].title,
                    'category': blogItems[0].category,
                    'content': blogItems[0].content,
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: SvgPicture.asset('assets/icons/pen.svg', height: 18, color: KBlack.withOpacity(.6),),
              ),
            ),
            SizedBox(width: 30),

            // Delete Icon Button
            InkWell(
              onTap: () {
                pressDelete(parentContext);
                print('clicked');
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                child: SvgPicture.asset('assets/icons/trash.svg', height: 18, color: KBlack.withOpacity(.6),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BlogTextIcon extends StatelessWidget {
  const BlogTextIcon({
    Key? key,
    required this.text,
    String this.iconSrc='assets/icons/eye-solid.svg',
    double this.iconHeight = 13,
    double this.textSize = 14,
    double this.spaceBetween = 3,
    double this.textOpacity = .7,
    double this.iconOpacity = .5,
  }) : super(key: key);

  final String text, iconSrc;
  final double iconHeight, textSize, spaceBetween, textOpacity, iconOpacity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${text}",
          style: TextStyle(
            color: KBlack.withOpacity(textOpacity), fontFamily: 'Poppins',
            fontSize: textSize,
          ),
        ),
        SizedBox(width: spaceBetween),
        // Likes Count
        SvgPicture.asset(
          iconSrc,
          height: iconHeight,
          color: KBlack.withOpacity(iconOpacity),
        )
      ],
    );
  }
}