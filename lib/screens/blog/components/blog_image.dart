import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


class BlogImage extends StatelessWidget {
  BlogImage({
    Key? key,
    this.imgUrl = '',
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: KBlack.withOpacity(.1),
        image: DecorationImage(
          image: NetworkImage(
            "$cloudinary_host$imgUrl",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



