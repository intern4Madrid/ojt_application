import 'package:flutter/material.dart';
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
  bool _isHiddenPassword = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Login loginMenu = Login();
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
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    obscureText: _isHiddenPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
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
                      prefixIcon: const Icon(Icons.lock),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigation(),
                          ),
                        );
                        // if (_formKey.currentState!.validate()) {
                        //   print('---PASOK---');
                        //   http.Response response = await loginMenu.login(
                        //       _usernameController.text,
                        //       _passwordController.text);
                        //   if (response.statusCode == 200 &&
                        //       jsonDecode(response.body)['message'] !=
                        //           'login failed') {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => BottomNavigation(),
                        //       ),
                        //     );
                        //     print('---PASOK2---');
                        //   } else {
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) => AlertDialog(
                        //         title: const Text(
                        //           'Error',
                        //           style: TextStyle(
                        //               fontSize: 25,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         content: Text("Invalid username or password"),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () {
                        //               Navigator.of(context).pop();
                        //             },
                        //             child: const Text('OK'),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   }
                        // }
                      },
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
