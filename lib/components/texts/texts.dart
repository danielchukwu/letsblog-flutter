import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';

class TextSmall extends StatelessWidget {
  const TextSmall({
    Key? key,
    required String this.text,
    FontWeight this.weight=FontWeight.w400,
    double this.opacity=.8,
    this.color,
  }) : super(key: key);

  final String text;
  final FontWeight weight;
  final double opacity;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: FONT_FAMILY,
        color: color,
        fontWeight: weight,
        fontSize: ds*1.4,  // 14
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium({
    Key? key,
    required String this.text,
    FontWeight this.weight=FontWeight.w400,
    double this.opacity=.8,
    this.color,
  }) : super(key: key);

  final String text;
  final FontWeight weight;
  final double opacity;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: FONT_FAMILY,
        color: color == null ? KBlack.withOpacity(opacity) : color,
        fontWeight: weight,
        fontSize: ds*1.6,
      ),
    );
  }
}

class TextLarge extends StatelessWidget {
  const TextLarge({
    Key? key,
    required String this.text,
    FontWeight this.weight=FontWeight.w400,
    double this.opacity=.8,
    this.color,
  }) : super(key: key);

  final String text;
  final FontWeight weight;
  final double opacity;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: FONT_FAMILY,
        color: color,
        fontWeight: weight,
        fontSize: ds*1.8,
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required String this.text,
    FontWeight this.weight=FontWeight.w500,
    double this.opacity=.8,
    this.color,
  }) : super(key: key);

  final String text;
  final FontWeight weight;
  final double opacity;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: FONT_FAMILY,
        color: color,
        fontWeight: weight,
        fontSize: ds*2.0,  // 20
      ),
    );
  }
}
