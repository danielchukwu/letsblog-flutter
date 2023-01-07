import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/size_config.dart';
import 'package:letsblog_flutter/utils.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar(
      {this.title = '',
      this.leadingIcon = '',
      this.showBackButton = false,
      this.showActionButton = false,
      this.actionText = 'save',
      this.pressSubmit});

  final String title, leadingIcon, actionText;
  final bool showBackButton, showActionButton;
  final Function? pressSubmit;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return SafeArea(
      child: AppBar(
        // Back Button
        leading: showBackButton || leadingIcon != ''
            ? Builder(
                builder: (context) {
                  if (leadingIcon == '') {
                    return IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_outlined,
                            color: Colors.black, size: 25));
                  } else {
                    return IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          leadingIcon,
                          height: 20,
                          color: KBlack.withOpacity(.8),
                        ));
                  }
                },
              )
            : null,
        centerTitle: true,
        // Title
        title: this.title.length == 0
            ? Image.asset("assets/images/lb-icon.png", height: 30)
            : Text(
                title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: KBlack.withOpacity(.8)),
              ),
        // Action
        actions: showActionButton
            ? <Widget>[
              TextButton(
                onPressed: () {
                  pressSubmit!();
                },
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: ds * 1.6,
                    color: KPrimaryColor,
                  ),
                ),
              ),
              SizedBox(width: 5,)
            ]
            : [],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Color(0xFF000000).withOpacity(.1),
                width: 1,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
