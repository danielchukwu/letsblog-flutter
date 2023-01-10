import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Image.asset(
            "assets/images/lb-icon.png",
            height: 60,
          ),
        ),
      ),
    );
  }
}
