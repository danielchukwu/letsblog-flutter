class SearchNavbarItem {
  String title;
  SearchNavbarItem({required this.title});
}

class FollowsNavbarItem {
  String title;
  FollowsNavbarItem({required this.title});
}

class DoubleNavbarItems {
  static int selectedIndex = 0;

  // This list should be set to 'navSearchItems' or 'navFollowItems'
  // when either the search_screen or the follows_screen is opened
  static List items = [];

  static List navSearchItems = [
    SearchNavbarItem(title: "User"),
    SearchNavbarItem(title: "Blog"),
  ];

  static List navFollowItems = [
    FollowsNavbarItem(title: 'followers'),
    FollowsNavbarItem(title: 'following'),
  ];
}