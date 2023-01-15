import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/buttons.dart';
import 'package:letsblog_flutter/components/input_fields.dart';
import 'package:letsblog_flutter/components/texts/texts.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/screens/login/components/auth_bottom_navbar.dart';
import 'package:letsblog_flutter/screens/login/login_screen.dart';
import 'package:letsblog_flutter/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // Login Controllers
  Map<String, List> signupControllers = {
    'name':                [TextEditingController(), 50],
    'username':            [TextEditingController(), 50],
    'email':               [TextEditingController(), 50],
    'occupation':          [TextEditingController(), 50],
    'work place':          [TextEditingController(), 50],
    'password':            [TextEditingController(), 50],
    'confirm password':    [TextEditingController(), 50],
  };

  // Submit
  void submitForm() {
    // write code for form submission here
    print('submit');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                // Logo
                Image.asset("assets/images/lb-icon.png", height: 48),

                // Sub-Text
                SizedBox(height: 10),
                TextMedium(text: "Sign up to let'sblog today."),

                // Username & Password
                SizedBox(height: 30),
                Column(
                  children: signupControllers.keys.map((key) => CustomInputField(
                    title: capitalize(key),
                    inputController: signupControllers[key]![0],
                    maxCharacters: null,
                    minLines: key == 'bio' ? 8 : 1,
                    maxLines: key == 'bio' ? 12 : 1,
                    // maxCharacters: null,
                  ))
                      .toList(),
                ),

                // Submit Button
                SizedBox(height: 10),
                AuthButton(title: 'Sign up', press: submitForm),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthBottomNavbar(
        text1: "Already Have An Account?",
        text2: " Login.",
        press: () =>
            Navigator.pushReplacementNamed(context, LoginScreen.routeName),
      ),
    );
  }
}
