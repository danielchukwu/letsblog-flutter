import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/ProfileNavbarItem.dart';


class ProfileNavbar extends StatefulWidget {
  const ProfileNavbar({Key? key, required this.press}) : super(key: key);

  final Function press;
  @override
  State<ProfileNavbar> createState() => _ProfileNavbarState(press: press);
}

class _ProfileNavbarState extends State<ProfileNavbar> {
  _ProfileNavbarState({required this.press});
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: List<Widget>.generate(
              ProfileNavbarItems.items.length,
                  (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Update the profile navbar selection when a profile
                      // navbar icon is clicked/tapped on
                      setState(() {
                        ProfileNavbarItems.setSelectedIndex(index);
                      });
                      // print('press');
                      // print(press);
                      press(index);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      duration: Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                        border: ProfileNavbarItems.selectedIndex == index
                            ? Border(
                          bottom: BorderSide(
                            width: 2,
                            color: KBlack.withOpacity(.6),
                          ),
                        )
                            : Border(),
                      ),
                      child: index == 0
                      // use Image.asset to letsblog emoji icon and then
                      // use SvgPicture.asset for user & phone svg icons
                      ? Image.asset(
                        ProfileNavbarItems.items[index].iconSrc,
                        height: 25,
                      )
                          : SvgPicture.asset(
                        ProfileNavbarItems.items[index].iconSrc,
                        height: 25,
                        color: KBlack.withOpacity(.7),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 0, color: KBlack.withOpacity(.1), thickness: 1),
        ],
      ),
    );
  }
}
