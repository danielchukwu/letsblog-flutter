import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/SearchNavbarItem.dart';
import 'package:letsblog_flutter/utils.dart';


// Search Navbar
class DoubleNavbar extends StatefulWidget {
  const DoubleNavbar({
    Key? key,
    this.top = 25, this.bottom = 8,
    required this.press,
  }) : super(key: key);

  final Function press;
  final double top, bottom;

  @override
  State<DoubleNavbar> createState() => _DoubleNavbarState(top: top, bottom: bottom, press: press);
}

class _DoubleNavbarState extends State<DoubleNavbar> {
  _DoubleNavbarState({
    this.top, this.bottom,
    required this.press,
  });

  final top, bottom;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: List<Widget>.generate(
              DoubleNavbarItems.items.length,
                  (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // update current widgets state
                        DoubleNavbarItems.selectedIndex = index;
                      });
                      // update state of search_screen
                      press(index);
                    },
                    child: Container(
                      // ds by default is 10px
                      padding: DoubleNavbarItems.selectedIndex == index
                          ? EdgeInsets.only(top: ds * (top/10), bottom: ds * (bottom/10) - 2) // 25, 8
                          : EdgeInsets.only(top: ds * (top/10), bottom: ds * (bottom/10)), // 25, 10
                      decoration: DoubleNavbarItems.selectedIndex == index
                          ? BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: ds * .2,
                                  color: KBlack.withOpacity(.6))))
                          : BoxDecoration(),
                      child: Text(
                        DoubleNavbarItems.items[index].title,
                        style: DoubleNavbarItems.selectedIndex == index
                            ? TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: ds * 1.8,
                            color: KBlack.withOpacity(.8))
                            : TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: ds * 1.8,
                            color: KBlack.withOpacity(.6)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ),
          ),
        ),
        getDivider(),
      ],
    );
  }
}
