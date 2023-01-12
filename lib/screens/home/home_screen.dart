import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/blog_card.dart';
import 'package:letsblog_flutter/components/bottom_navbar.dart';
import 'package:letsblog_flutter/components/main_app_bar.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape
                ? 2
                : 1,
            childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape
                ? .7
                : .75,
          ),
          itemCount: blogItems.length,
          itemBuilder: (context, index) => BlogCard(blog: blogItems[index]),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  PreferredSize buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: MainAppBar(showBackButton: false),
    );
  }
}
