import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/bottom_navbar.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_content.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_image.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_title.dart';
import 'package:letsblog_flutter/screens/blog/components/bog_user_profile.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_comments.dart';
import 'package:letsblog_flutter/screens/blog/components/blog_likes_views.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);
  static const routeName = '/blogs';

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    Map blog = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          // Used multiple paddings because Like-Views layer required a different
          // padding size due to it's on-click animations
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image
            BlogImage(imgUrl: blog['cover']),

            // Title
            BlogTitle(title: blog['title']),

            // Likes-Views
            BlogLikesViews(data: blog),

            // Profile
            UserProfile(data: blog),

            // Content
            BlogContent(content: blog['content'] * 3),

            // Comments
            BlogComments(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  PreferredSize buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(showBackButton: true),
    );
  }
}

