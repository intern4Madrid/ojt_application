import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ojt_app/core/services/login_api.dart';
import 'package:ojt_app/screens/reset_password_screens.dart';
import 'package:ojt_app/screens/sign_up_screens.dart';
import 'package:ojt_app/widgets/bottom_navigation_bar_widgets.dart';

import '../theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  bool _isHiddenPassword = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Login apilogin = Login();
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontStyle: FontStyle.italic, letterSpacing: 1.5),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, letterSpacing: 1.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      labelStyle: const TextStyle(letterSpacing: 1.5),
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                      prefixIcon: const Icon(Icons.fingerprint_outlined),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? const Icon(Icons.visibility, size: 20)
                            : const Icon(Icons.visibility_off, size: 20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  // child: TextFormField(
                  //   obscureText: _isHiddenPassword,
                  //   textInputAction: TextInputAction.next,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   controller: _passwordController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //     labelStyle: TextStyle(
                  //         fontStyle: FontStyle.italic, letterSpacing: 1.5),
                  //     hintText: 'Enter your password',
                  //     hintStyle: TextStyle(
                  //         fontStyle: FontStyle.italic, letterSpacing: 1.5),
                  //     border: const OutlineInputBorder(),
                  //     suffixIcon: InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           _isHiddenPassword = !_isHiddenPassword;
                  //         });
                  //       },
                  //       child: const Icon(Icons.visibility),
                  //     ),
                  //     prefixIcon: const Icon(Icons.fingerprint_outlined),
                  //   ),
                  // ),
                ),
                SizedBox(
                  height: 20,
                ),

                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ResetPasswordScreen(),
                //       ),
                //     );
                //   },
                //   child: Text(
                //     "Forgot password?",
                //     style: TextStyle(
                //       color: kZambeziColor,
                //       fontSize: 14,
                //       decoration: TextDecoration.underline,
                //       decorationThickness: 1,
                //     ),
                //   ),
                // ),
                Center(
                  child: SizedBox(
                    height: 70,
                    width: 340,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(20)),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        print('>>>>>CLICK BUTTON<<<<');
                        if (_formKey.currentState!.validate()) {
                          print('---PASOK---');
                          http.Response response = await apilogin.login(
                              _emailController.text, _passwordController.text);
                          if (response.statusCode == 200 &&
                              jsonDecode(response.body)['message'] !=
                                  'login failed') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavigation(),
                              ),
                            );
                            print('---PASOK2---');
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                  'Error',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Text("Invalid username or password"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                        ;
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
