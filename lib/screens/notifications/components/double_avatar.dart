import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


class DoubleAvatar extends StatelessWidget {
  DoubleAvatar({required this.avatarUrl, required this.avatarUrlBehind});

  String avatarUrl, avatarUrlBehind;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stack Size
        Container(width: 50, height: 50),

        // Image Behind
        Positioned(
          width: 38,
          height: 38,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: KBlack.withOpacity(.2),
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                  image: NetworkImage('${cloudinary_host}${avatarUrlBehind}'),
                  fit: BoxFit.cover,
                )),
          ),
        ),

        // Image In Front
        Positioned(
          width: 40,
          height: 40,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: KBlack.withOpacity(.2),
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                  image: NetworkImage('${cloudinary_host}${avatarUrl}'),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    );;
  }
}
