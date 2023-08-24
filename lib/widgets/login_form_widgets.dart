import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("Email", false),
        buildInputForm("Password", true),
      ],
    );
  }

  buildInputForm(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: kPrimaryColor),
            // ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
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
