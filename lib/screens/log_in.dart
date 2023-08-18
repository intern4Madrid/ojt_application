import 'package:flutter/material.dart';
import 'package:ojt_app/screens/reset_password_screen.dart';
import 'package:ojt_app/screens/sign_up.dart';
import 'package:ojt_app/widgets/bottom_navigation_bar_admin.dart';
import 'package:ojt_app/widgets/login_form.dart';
import 'package:ojt_app/widgets/primary_button.dart';

import '../theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 250,
                    child: Image.asset("images/icon.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "New to this app?",
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LogInForm(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigation(),
                      ),
                    );
                  },
                  child: PrimaryButton(buttonText: "Log In")),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   "Or Log In with:",
              //   style: subTitle.copyWith(color: kBlackColor),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // LogInOption(),
            ],
          ),
        ),
      ),
    );
  }
}
