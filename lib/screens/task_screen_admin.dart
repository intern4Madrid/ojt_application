import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class TaskAdmin extends StatefulWidget {
  const TaskAdmin({super.key});

  @override
  State<TaskAdmin> createState() => _TaskAdminState();
}

class _TaskAdminState extends State<TaskAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            elevation: 1,
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Edit"),
              ),
            ],
          ),
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Due date:",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Assignment title:",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                "Description:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                "Attachment:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                "Students who posted their activity:",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
