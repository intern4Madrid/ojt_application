import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ojt_app/core/services/create_account_api.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/sign_up_controller.dart';
import 'package:ojt_app/utils/getter_setter/sign_up_getter_setter.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = SignUpController();
  String dropdownUserLevel = '--Select an option--';
  bool _isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    CreateUserAPI createUserAPI = CreateUserAPI();
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
                onChanged: (value) {
                  SignUppp.setFirstName(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Firstname',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.lastname,
                onChanged: (value) {
                  SignUppp.setLastName(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Lastname',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.email,
                onChanged: (value) {
                  SignUppp.setEmail(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: kDefaultPadding,
              child: TextFormField(
                controller: signUpController.phone,
                onChanged: (value) {
                  SignUppp.setPhone(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
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
                onChanged: (value) {
                  SignUppp.setPassword(value);
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
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
                onChanged: (value) {
                  SignUppp.setConfirmPassword(value);
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
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
                controller: signUpController.userlevel,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: DropdownButtonHideUnderline(
                      child: SizedBox(
                        width: 250,
                        child: DropdownButton(
                          value: dropdownUserLevel,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: const TextStyle(
                            color: kPrimaryColor,
                            letterSpacing: 1.5,
                          ),
                          onChanged: (value) {
                            setState(() {
                              dropdownUserLevel = value!;
                              SignUppp.setUserLevel(value);
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                                value: '--Select an option--',
                                child: Center(
                                    child: Text('--Select an option--'))),
                            DropdownMenuItem(
                                value: 'User',
                                child: Center(
                                    child: Text(
                                  'User',
                                  style: TextStyle(color: Colors.black),
                                ))),
                            DropdownMenuItem(
                                value: 'Admin',
                                child: Center(
                                    child: Text(
                                  'Admin',
                                  style: TextStyle(color: Colors.black),
                                )))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: TextFormField(
            //     controller: signUpController.userlevel,
            //     decoration: InputDecoration(
            //       suffixIcon: DropdownButtonHideUnderline(
            //         child: Padding(
            //           padding: EdgeInsets.all(10.0),
            //           child: SizedBox(
            //             width: 50,
            //             child: DropdownButton(
            //               value: dropdownUserLevel,
            //               icon: Icon(Icons.arrow_drop_down),
            //               onChanged: (value) {
            //                 setState(() {
            //                   dropdownUserLevel = value!;
            //                   SignUppp.setUserLevel(value);
            //                 });
            //               },
            //               items: [
            //                 DropdownMenuItem(
            //                   child: Center(
            //                     child: Text('Option'),
            //                   ),
            //                   value: '--Select an option--',
            //                 ),
            //                 DropdownMenuItem(
            //                   child: Text("Admin"),
            //                   value: 'Admin',
            //                 ),
            //                 DropdownMenuItem(
            //                   child: Text("User"),
            //                   value: 'Admin',
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       labelText: 'User level',
            //       labelStyle: TextStyle(
            //         color: kPrimaryColor,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 15,
            //       ),
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: SizedBox(
                height: 70,
                width: 340,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(20)
                      // backgroundColor: _isHovered ? Colors.lightBlue : Colors.white,
                      ),
                  onPressed: () async {
                    print(SignUppp.getFirstName());
                    print(SignUppp.getUserLevel());
                    if (SignUppp.getFirstName() != null &&
                        SignUppp.getLastName() != null &&
                        SignUppp.getEmail() != null &&
                        SignUppp.getPhone() != null &&
                        SignUppp.getPassword() != null &&
                        SignUppp.getConfirmPassword() != null &&
                        SignUppp.getUserLevel() != null) {
                      try {
                        http.Response response = await createUserAPI.adduser(
                            SignUppp.getFirstName(),
                            SignUppp.getLastName(),
                            SignUppp.getEmail(),
                            SignUppp.getPhone(),
                            SignUppp.getPassword(),
                            SignUppp.getConfirmPassword(),
                            SignUppp.getUserLevel());
                        if (response.statusCode == 200 &&
                            jsonDecode(response.body)['message'] ==
                                'User has been added') {
                          print('Already added user');
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Successful',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              content: Text("New user successfully created"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      dropdownUserLevel =
                                          '--Select an option--';
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        // print(response.body);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    } else {
                      debugPrint('checking data');
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreen(),
            //       ),
            //     );
            //   },
            //   child: Padding(
            //     padding: kDefaultPadding,
            //     child: PrimaryButton(buttonText: "Sign Up"),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
