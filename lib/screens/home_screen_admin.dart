import 'package:flutter/material.dart';
import 'package:ojt_app/screens/add_assignment.dart';
import 'package:ojt_app/screens/log_in.dart';
import 'package:ojt_app/screens/notification.dart';
import 'package:ojt_app/screens/to_do.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                "Name",
                style: titleText,
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.today_outlined),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 8,
            backgroundColor: kPrimaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Assignment(),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
