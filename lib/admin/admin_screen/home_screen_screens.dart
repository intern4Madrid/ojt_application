import 'package:flutter/material.dart';
import 'package:ojt_app/admin/admin_screen/add_assignment_screens.dart';
import 'package:ojt_app/admin/admin_widgets/task_homescreen_widgets.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/loggedin_getter_setter.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';
import 'package:ojt_app/w.screens/notification_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Task(),
      drawer: NavigationDrawer(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                backgroundImage: AssetImage("images/avatar_icon.png"),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            elevation: 8,
            backgroundColor: kPrimaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAssignment(),
                ),
              );
            },
            label: Text("Add assignmet"),
          ),
        ],
      ),
    );
  }
}
