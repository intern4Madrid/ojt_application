import 'package:flutter/material.dart';
import 'package:ojt_app/User/user_widgets/user_calendar_table.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';
import 'package:ojt_app/w.screens/notification_screens.dart';

class UserCalendar extends StatefulWidget {
  const UserCalendar({super.key});

  @override
  State<UserCalendar> createState() => _UserCalendarState();
}

class _UserCalendarState extends State<UserCalendar> {
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
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                backgroundImage: AssetImage("images/avatar_icon.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Name",
                style: titleText,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
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
