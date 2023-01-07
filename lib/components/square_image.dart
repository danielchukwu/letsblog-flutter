import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/utils.dart';

class SquareImage extends StatelessWidget {
  const SquareImage({
    Key? key,
    required this.img,
    this.width=45, this.height=45
  }) : super(key: key);

  final String img;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/blogs",
          arguments: {
            'cover': blogItems[0].cover,
            'category': blogItems[0].category,
            'title': blogItems[0].title,
            'content': blogItems[0].content,
            'username': blogItems[0].username,
            'avatar': blogItems[0].avatar,
            'views': blogItems[0].views,
            'likes_count': blogItems[0].likes_count,
            'dislikes_count': blogItems[0].dislikes_count,
            'liked': blogItems[0].liked,
            'disliked': blogItems[0].disliked,
            'is_following': blogItems[0].is_following,
          },
        );
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: KBlack.withOpacity(.2),
          image: DecorationImage(
              image: NetworkImage('$cloudinary_host$img'),
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}