import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("First Name", false),
        buildInputForm("Last Name", false),
        buildInputForm("Email", false),
        buildInputForm("Phone", false),
        buildInputForm("Password", true),
        buildInputForm("Confirm Password", true),
      ],
    );
  }

  buildInputForm(String hint, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: TextFormField(
        obscureText: pass ? _isObsecure : false,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: kTextFieldColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     color: kPrimaryColor,
            //   ),
            // ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                    icon: _isObsecure
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: kTextFieldColor,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: kPrimaryColor,
                          ),
                  )
                : null),
      ),
    );
  }
}
