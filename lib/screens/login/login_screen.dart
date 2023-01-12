import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/buttons.dart';
import 'package:letsblog_flutter/components/input_fields.dart';
import 'package:letsblog_flutter/components/texts/texts.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/screens/login/components/auth_bottom_navbar.dart';
import 'package:letsblog_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:letsblog_flutter/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Login Controllers
  Map<String, List> loginControllers = {
    'username': [TextEditingController(), 50],
    'password':    [TextEditingController(), 50]
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
            height: MediaQuery.of(context).size.height - 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset("assets/images/lb-icon.png", height: 48),

                // Sub-Text
                SizedBox(height: 10),
                TextMedium(text: "Login to let'sblog today."),

                // Username & Password
                SizedBox(height: 30),
                Column(
                  children: loginControllers.keys.map((key) => CustomInputField(
                    title: capitalize(key),
                    inputController: loginControllers[key]![0],
                    maxCharacters: null,
                    minLines: key == 'bio' ? 8 : 1,
                    maxLines: key == 'bio' ? 12 : 1,
                    // maxCharacters: null,
                  ))
                      .toList(),
                ),

                // Submit Button
                SizedBox(height: 10),
                AuthButton(title: 'Login', press: submitForm),

                // Forgot Password
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {},
                  child: TextMedium(text: "Forgot Password?", color: KPrimaryColor, weight: FontWeight.w500)
                )

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthBottomNavbar(
        text1: "Don't Have An Account?",
        text2: " Sign Up.",
        press: () =>
            Navigator.pushReplacementNamed(context, SignUpScreen.routeName),
      ),
    );
  }
}

