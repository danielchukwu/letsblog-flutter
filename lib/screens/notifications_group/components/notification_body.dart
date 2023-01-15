import 'package:flutter/material.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_comments.dart';
import 'package:letsblog_flutter/screens/notifications_group/components/notification_card.dart';
import 'package:letsblog_flutter/utils.dart';

class NotificationGroupBody extends StatelessWidget {
  const NotificationGroupBody({Key? key, required this.data}) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    String appendText = getAppendText(type: data[0]['type']);
    String type = data[0]['type'];

    if (type == 'follow' || type == 'liked_blog' || type == 'liked_comment'){
      // Likers & Followers
      // Show notifications for liked_blog, liked_comment, follow
      return Column(
        children: List<Widget>.generate(
            data.length,
                (index) => NotificationCard(
                data: data[index], appendText: appendText)),
      );
    } else {
      // Commenters
      // show comment notifications e.g commented_blog, commented_comment
      return BlogComments(showHeader: false,);
    }
  }
}