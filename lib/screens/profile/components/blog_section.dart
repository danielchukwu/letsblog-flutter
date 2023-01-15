import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/blog_card.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/models/ProfileNavbarItem.dart';
import 'package:letsblog_flutter/screens/manage_blogs/manage_blogs_screen.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({Key? key, required this.user}) : super(key: key);

  final Map user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Show Manage button only when it's the owners profile and when
        // blog navbar is selected
        user['id'] == 1 && ProfileNavbarItems.selectedIndex == 0
            ? Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ManageBlogsScreen.routeName),
                child: Text(
                  'Manage Blogs',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: KBlack.withOpacity(.5)),
                ),
              ),
            ],
          ),
        )
            : SizedBox(),

        // Blogs
        ProfileNavbarItems.selectedIndex == 0
            ? Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: List<Widget>.generate(
              blogItems.length,
                  (index) => BlogCard(blog: blogItems[index]),
            ),
          ),
        )
            : SizedBox(),
      ],
    );
  }
}
