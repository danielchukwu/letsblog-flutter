import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


class SingleRoundAvatar extends StatelessWidget {
  const SingleRoundAvatar({Key? key, required this.avatarUrl, this.width = 50, this.height = 50 }) : super(key: key);

  final String avatarUrl;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: KBlack.withOpacity(.2),
        image: DecorationImage(
          image: NetworkImage('$cloudinary_host$avatarUrl'),
          fit: BoxFit.cover,
        ),
      ),
    );;
  }
}
