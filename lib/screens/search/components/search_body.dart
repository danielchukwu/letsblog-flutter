import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letsblog_flutter/models/BlogItem.dart';
import 'package:letsblog_flutter/models/SearchNavbarItem.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:letsblog_flutter/screens/search/components/blog_search_card.dart';
import 'package:letsblog_flutter/screens/search/components/user_search_card.dart';

// Search Body
class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate search results for either users or blog
    return Column(
      children: DoubleNavbarItems.selectedIndex == 0
          ? List<Widget>.generate(
          userItems.length,
              (index) => UserSearchCard(data: {
            'id': userItems[index].id,
            'avatar': userItems[index].avatar,
            'username': userItems[index].username,
            'name': userItems[index].name,
            'blog_count': Random().nextInt(100),
          }))
          : List<Widget>.generate(
          blogItems.length,
              (index) => BlogSearchCard(data: {
            'title': blogItems[index].title,
            'username': blogItems[index].username,
            'cover': blogItems[index].cover,
            'views_count': Random().nextInt(100),
          })),
    );
  }
}