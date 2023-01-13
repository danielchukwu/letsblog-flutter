import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/blog_card.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';

class ManageBlogsScreen extends StatefulWidget {
  const ManageBlogsScreen({Key? key}) : super(key: key);
  static const routeName = '/manage-blogs';

  @override
  State<ManageBlogsScreen> createState() => _ManageBlogsScreenState();
}

class _ManageBlogsScreenState extends State<ManageBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppBar(showBackButton: true, title: 'Manage Blogs'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            blogItems.length,
            (index) => BlogCard(blog: blogItems[index], mode: 'edit',))
        ),
      ),
    );
  }
}
