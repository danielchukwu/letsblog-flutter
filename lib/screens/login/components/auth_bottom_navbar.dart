import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';

class AuthBottomNavbar extends StatelessWidget {
  const AuthBottomNavbar({
    Key? key,
    required this.text1,
    required this.text2,
    required this.press,
  }) : super(key: key);

  final String text1, text2;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
          border: Border(top: BorderSide(width: 1, color: KBlack.withOpacity(.1)))
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            style: TextStyle( fontFamily: FONT_FAMILY),
            children: [
              TextSpan(text: text1),
              TextSpan(
                  text: text2,
                  style: TextStyle(
                    color: KPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      press();
                    }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
