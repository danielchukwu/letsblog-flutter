import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/CommentItem.dart';
import 'package:letsblog_flutter/screens/blog/components/comment_card.dart';
import 'package:letsblog_flutter/utils.dart';

class BlogComments extends StatelessWidget {
  const BlogComments({Key? key, this.showHeader = true}) : super(key: key);

  final bool showHeader;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: showHeader ? <Widget>[
              getDivider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  'Comments',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                      color: KBlack.withOpacity(.8)),
                ),
              ),
              getDivider(),
            ] : [],
          ),

          // Comments
          Column(
            children: List<Widget>.generate(commentItems.length,
                    (index) => CommentCard(commentItem: commentItems[index])),
          ),
        ],
      ),
    );
  }
}