import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  final content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        content,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            color: KBlack.withOpacity(.5)),
      ),
    );
  }
}