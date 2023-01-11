import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';


class BlogTitle extends StatelessWidget {
  const BlogTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        title,
        style: TextStyle(
            color: KBlack.withOpacity(.9),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
            height: 1.4),
      ),
    );
  }
}