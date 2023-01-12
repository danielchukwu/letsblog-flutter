import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';

class SectionHeader extends StatefulWidget {
  SectionHeader({
    Key? key,
    required this.title,
    required this.showProfileSection,
    required this.press,
  }) : super(key: key);

  final String title;
  bool showProfileSection;
  Function press;

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  // Dropdown handlers

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Section Title
        Text(
          widget.title,
          style: TextStyle(
              fontFamily: FONT_FAMILY,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: KBlack.withOpacity(.8)
          ),
        ),

        // Section Title Dropdown Icon
        GestureDetector(
          onTap: () => setState(() {
            widget.showProfileSection = !widget.showProfileSection;
            widget.press();
          }),
          child: AnimatedRotation(
            turns: widget.showProfileSection == true ? 0 : 0.5,
            duration: Duration(milliseconds: 100),
            child: Icon(Icons.keyboard_arrow_down, color: KBlack.withOpacity(.7), size: 26,
            ),
          ),
        )


      ],
    );
  }
}
