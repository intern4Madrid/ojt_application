import 'package:flutter/material.dart';
import 'package:ojt_app/screens/log_in_screens.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/primary_button_widgets.dart';
import 'package:ojt_app/widgets/reset_passwordform_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Reset Password",
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Please Enter your Email Address.",
              style: subTitle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ResetForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: PrimaryButton(
                buttonText: "Reset Password ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
