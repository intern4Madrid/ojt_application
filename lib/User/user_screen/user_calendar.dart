import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ojt_app/User/user_widgets/user_calendar_table.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/loggedin_getter_setter.dart';
import 'package:ojt_app/utils/pickImage.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';
import 'package:ojt_app/w.screens/notification_screens.dart';

class UserCalendar extends StatefulWidget {
  const UserCalendar({super.key});

  @override
  State<UserCalendar> createState() => _UserCalendarState();
}

class _UserCalendarState extends State<UserCalendar> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(80),
              child: Center(
                child: Text(
                  "Calendar",
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
      body: Container(
        child: const UserCalendarWindow(),
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
                        color: Colors.pink,
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
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.today_outlined),
                title: Text("To-do"),
                onTap: () {},
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.notifications_outlined),
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
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
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
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
