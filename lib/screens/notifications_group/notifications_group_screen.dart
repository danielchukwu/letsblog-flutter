import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_comments.dart';
import 'package:letsblog_flutter/screens/notifications_group/components/CommentHeaderSection.dart';
import 'package:letsblog_flutter/screens/notifications_group/components/header_section.dart';
import 'package:letsblog_flutter/screens/notifications_group/components/notification_body.dart';
import 'package:letsblog_flutter/screens/notifications_group/components/notification_card.dart';
import 'package:letsblog_flutter/utils.dart';

class NotificationGroupScreen extends StatelessWidget {
  const NotificationGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    String appendText = getAppendText(type: data[0]['type']);
    // print(data);

    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Blog or Comment or Follow Header Section
            HeaderSection(
                type: data[0]['type'],
                title:
                    'Messi Emotional After Firing To The World Cup After Firing To The W...',
                img: 'pvf8gjt6azuqjunmqfjy'),

            // Comment HeaderSection
            // show your comment that was either liked or commented on
            CommentSection(comment: "I knew i wouldn't fail", type: data[0]['type']),

            // Groups Notification Body
            // show the actual notifications for this group
            NotificationGroupBody(data: data),

          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(title: 'Notifications', showBackButton: true),
    );
  }
}

