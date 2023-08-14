import 'package:flutter/material.dart';
import 'package:ojt_app/screens/log_in.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/primary_button.dart';
import 'package:ojt_app/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                "Create Account",
                style: titleText,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    "Already a member?",
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kDefaultPadding,
              child: SignUpForm(),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: CheckBox(
            //     text: 'Agree to Terms and Condition.',
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: kDefaultPadding,
              child: PrimaryButton(buttonText: "Sign Up"),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: Text(
            //     "Or Log In with:",
            //     style: subTitle.copyWith(color: kBlackColor),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: LogInOption(),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
