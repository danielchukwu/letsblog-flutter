import 'package:flutter/cupertino.dart';
import 'package:letsblog_flutter/utils.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({Key? key, required this.comment, required this.type}) : super(key: key);

  final String comment, type;
  @override
  Widget build(BuildContext context) {
    if (type == 'liked_comment' || type == 'commented_comment'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getSize(context) * 1.5),
          // Comment Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(context) * 2),
            child: Text(
              'Your Comment :',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: getSize(context) * 1.4,
              ),
            ),
          ),
          SizedBox(height: getSize(context) * 1), // 10

          // Comment Body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(context) * 2),
            child: Text(comment,
                style: TextStyle(
                    fontFamily: 'Poppins', fontStyle: FontStyle.italic)),
          ),
          SizedBox(height: getSize(context) * 1.5),
          getDivider(),
        ],
      );
    }
    return SizedBox();
  }
}