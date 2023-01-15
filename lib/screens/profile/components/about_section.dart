import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/ProfileNavbarItem.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key, required this.user}) : super(key: key);

  final Map user;

  @override
  Widget build(BuildContext context) {
    // Note: About & Skill Widgetry should appear if the
    // about icon is clicked/tapped on

    return ProfileNavbarItems.selectedIndex == 1
        ? Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About
          Text(
            'About',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: KBlack.withOpacity(.8),
            ),
          ),
          SizedBox(height: 20),
          Text(
            user['about'] != null ? user['about'] : '',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KBlack.withOpacity(.6),
            ),
          ),

          // Socials
          SizedBox(height: 20),
          Text(
            'Skills',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: KBlack.withOpacity(.8),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            children: List<Widget>.generate(
              user['skills'].length,
                  (index) => TabletCard(title: user['skills'][index]),
            ),
          )
        ],
      ),
    )
        : SizedBox();
  }
}


class TabletCard extends StatelessWidget {
  const TabletCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      margin: EdgeInsets.only(bottom: 15, right: 15),
      decoration: BoxDecoration(
        color: KBlack.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins',
          // fontSize: 16,
          // fontWeight: FontWeight.w500,
          color: KBlack.withOpacity(.8),
        ),
      ),
    );
  }
}
