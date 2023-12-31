import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ojt_app/User/user_widgets/user_task_homescreen.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/loggedin_getter_setter.dart';
import 'package:ojt_app/utils/pickImage.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';
import 'package:ojt_app/w.screens/notification_screens.dart';
import 'package:ojt_app/w.screens/to_do_screens.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  String email = LoggedIn.getEmail();
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(80),
              child: Center(
                child: Text(
                  "TrainEase",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UserTask(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
      drawer: NavigationDrawer(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: _image != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("images/avatar_icon.png"),
                          ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.red.shade900,
                      ),
                    ),
                    bottom: -10,
                    left: 55,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                email,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.today_outlined,
                  color: Colors.black,
                ),
                title: Text("To-do"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ToDoScreen(),
                    ),
                  );
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                title: Text("Notifications"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ),
                  );
                },
              ),
              // Divider(
              //   color: Colors.black,
              // ),
              // ListTile(
              //   title: Text('Dark Mode'),
              //   trailing: Switch(
              //     value: themeProvider.isDarkMode,
              //     onChanged: (value) {
              //       themeProvider.toggleTheme();
              //     },
              //   ),
              // ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                ),
                title: Text("Sign out"),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("Are you sure you want to Log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
