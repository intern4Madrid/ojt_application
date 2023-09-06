import 'package:flutter/material.dart';
import 'package:ojt_app/User/user_screen/task_user_screen.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

class UserTask extends StatefulWidget {
  const UserTask({super.key});

  @override
  State<UserTask> createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  String description = Taskkk.getDescription();
  String assign = Taskkk.getAssign();
  String duedate = Taskkk.getDueDate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskUser(),
                  ),
                );
              },
              child: Container(
                height: 115,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Assignment title:",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            assign,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Row(
                        children: [
                          Text(
                            "Description:",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            description,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Row(
                        children: [
                          Text(
                            "Due date:",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            duedate,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
