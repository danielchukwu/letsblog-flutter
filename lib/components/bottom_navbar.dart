import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/Navbar.dart';
import 'package:letsblog_flutter/models/UserItem.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key, this.showNavbar=true}) : super(key: key);

  final bool showNavbar;
  @override
  Widget build(BuildContext context) {
    if (showNavbar == false) {
      return SizedBox();
    }
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: KBlack.withOpacity(.1))
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                  navItems.items.length,
                  (index) => buildIconButton(
                      iconSrc: navItems.items[index].icon,
                      isActive: index == navItems.selectedIndex,
                    press: () {
                        // Change Navbar
                        navItems.changeNavbar(index);
                        if (navItems.isNewNavbar() && index == 4) {
                          // Profile
                          Navigator.of(context).pushReplacementNamed(
                            '/profile',
                            arguments: owner
                          );
                        } else if (navItems.isNewNavbar() && index == 2) {
                          // Create Blog
                          // We won't be changing navbar
                          navItems.changeBackToPreviousNavbar();
                          Navigator.of(context).pushNamed(
                              navItems.items[index].destination
                          );
                        }
                        else if (navItems.isNewNavbar()){
                          Navigator.of(context).pushReplacementNamed(
                              navItems.items[index].destination,
                          );
                        }
                    },
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconButton({iconSrc, isActive, press}) {
    return IconButton(
      icon: SvgPicture.asset(
        iconSrc,
        height: 25,
        color: isActive ? KPrimaryColor : KBlack.withOpacity(.7),
      ),
      onPressed: press,
    );
  }
}
