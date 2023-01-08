import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


class BlogImage extends StatelessWidget {
  const BlogImage({
    Key? key,
    required this.imageUrl
  }) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      child: Container(
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: KBlack.withOpacity(.1),
          image: DecorationImage(
            image: NetworkImage(
              "$cloudinary_host$imageUrl",
            ),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}