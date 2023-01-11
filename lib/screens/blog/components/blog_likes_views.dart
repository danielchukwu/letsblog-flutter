import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';

class BlogLikesViews extends StatefulWidget {
  const BlogLikesViews({Key? key, required this.data}) : super(key: key);
  final Map data;
  @override
  State<BlogLikesViews> createState() => _BlogLikesViewsState();
}

class _BlogLikesViewsState extends State<BlogLikesViews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Likes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Like
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.data['liked'] == false) {
                      widget.data['liked'] = true;
                      widget.data['likes_count']++;

                      if (widget.data['disliked'] == true) {
                        widget.data['disliked'] = false;
                        widget.data['dislikes_count']--;
                      }
                    }
                  });
                },
                customBorder: CircleBorder(),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    "assets/icons/thumbs-up.svg",
                    height: 18,
                    color: widget.data['liked'] == true
                        ? KPrimaryColor
                        : KBlack.withOpacity(.5),
                  ),
                ),
              ),
              Text(
                "${widget.data['likes_count']}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: KBlack.withOpacity(.5),
                ),
              ),
              SizedBox(width: 20),
              // Dislike
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.data['disliked'] == false) {
                      widget.data['disliked'] = true;
                      widget.data['dislikes_count']++;

                      if (widget.data['liked'] == true) {
                        widget.data['liked'] = false;
                        widget.data['likes_count']--;
                      }
                    }
                  });
                },
                customBorder: CircleBorder(),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    "assets/icons/thumbs-down.svg",
                    height: 18,
                    color: widget.data['disliked'] == true
                        ? KPrimaryColor
                        : KBlack.withOpacity(.5),
                  ),
                ),
              ),
              Text(
                "${widget.data['dislikes_count']}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: KBlack.withOpacity(.5),
                ),
              ),
            ],
          ),
          // Views
          Row(
            children: <Widget>[
              Text(
                "${widget.data['views']}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: KBlack.withOpacity(.5),
                ),
              ),
              SizedBox(width: 8),
              // Likes Count
              SvgPicture.asset(
                'assets/icons/eye-solid.svg',
                height: 15,
                color: KBlack.withOpacity(.5),
              )
            ],
          )
        ],
      ),
    );
  }
}