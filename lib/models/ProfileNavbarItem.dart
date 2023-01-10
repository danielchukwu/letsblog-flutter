class ProfileNavbarItem {
  final String iconSrc;

  ProfileNavbarItem({required this.iconSrc});
}

class ProfileNavbarItems {
  static int selectedIndex = 0;

  static void setSelectedIndex(index) => selectedIndex = index;

  static List<ProfileNavbarItem> items = [
    ProfileNavbarItem(iconSrc: "assets/images/lb-emoji.png"),
    ProfileNavbarItem(iconSrc: "assets/icons/user-solid.svg"),
    ProfileNavbarItem(iconSrc: "assets/icons/phone-solid.svg"),
  ];
}