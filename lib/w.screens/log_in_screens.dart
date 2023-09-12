import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ojt_app/User/user_screen/user_loading_screen.dart';
import 'package:ojt_app/admin/admin_screen/loading_screen.dart';
import 'package:ojt_app/core/services/login_api.dart';
import 'package:ojt_app/utils/getter_setter/loggedin_getter_setter.dart';
import 'package:ojt_app/w.screens/reset_password_screens.dart';
import 'package:ojt_app/w.screens/sign_up_screens.dart';

import '../theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String userLevel = LoggedIn.getUserLevel();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Login apilogin = Login();
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
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
                            builder: (context) => SignUpScreen(),
                          ),
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
                      prefixIcon: Icon(Icons.email_outlined),
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
                      labelStyle: const TextStyle(
                          fontStyle: FontStyle.italic, letterSpacing: 1.5),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 340,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade900,
                            Colors.red,
                            Colors.red.shade200,
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.all(5),
                        ),
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
                                _emailController.text,
                                _passwordController.text);
                            if (response.statusCode == 200 &&
                                jsonDecode(response.body)['message'] !=
                                    'login failed') {
                              if (jsonDecode(response.body)['user_level'] ==
                                  'Admin') {
                                print('---ADMIN LOGIN---');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminLoadingScreen(),
                                  ),
                                );
                              } else if (jsonDecode(
                                      response.body)['user_level'] ==
                                  'User') {
                                print('---USER LOGIN---');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserLoadingScreen(),
                                  ),
                                );
                              }
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
                SizedBox(height: 160),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copyright,
                      size: 15,
                    ),
                    SizedBox(width: 2),
                    Text(
                      'All Rights Reserved',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
