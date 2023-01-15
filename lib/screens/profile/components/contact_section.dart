import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/ProfileNavbarItem.dart';
import 'package:letsblog_flutter/models/SocialItem.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key, required this.user}) : super(key: key);

  final Map user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: ProfileNavbarItems.selectedIndex == 2
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Socials',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: KBlack.withOpacity(.8),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: 200,
                  child: Wrap(
                    children: List<Widget>.generate(
                      SocialItems.socialsList.length,
                      (index) => user[SocialItems.socialsList[index]] != null
                          ? SocialLink(index: index)
                          : SizedBox(),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(),
    );
  }
}

class SocialLink extends StatelessWidget {
  const SocialLink({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          SvgPicture.asset(
            SocialItems.items[SocialItems.socialsList[index]],
            color: KBlack.withOpacity(.7),
            width: 26,
          ),
          SizedBox(width: 15),
          Text(
            SocialItems.socialsList[index],
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: KBlack.withOpacity(.7),
            ),
          )
        ],
      ),
    );
  }
}
