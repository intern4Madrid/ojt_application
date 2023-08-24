import 'package:flutter/material.dart';
import 'package:ojt_app/screens/log_in_screens.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/sign_up_controller.dart';
import 'package:ojt_app/widgets/primary_button_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

SignUpController signUpController = SignUpController();

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
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
              height: 50,
            ),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.firstname,
                decoration: const InputDecoration(
                  labelText: 'Firstname',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.lastname,
                decoration: const InputDecoration(
                  labelText: 'Lastname',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                obscureText: _isHiddenPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: signUpController.password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isHiddenPassword = !_isHiddenPassword;
                      });
                    },
                    child: const Icon(Icons.visibility),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                obscureText: _isHiddenPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: signUpController.confirmpassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isHiddenPassword = !_isHiddenPassword;
                      });
                    },
                    child: const Icon(Icons.visibility),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 170,
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
              child: Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(buttonText: "Sign Up"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
