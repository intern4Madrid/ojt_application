import 'package:flutter/material.dart';
import 'package:ojt_app/admin/admin_screen/task_admin_screens.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
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
                    builder: (context) => TaskAdmin(),
                  ),
                );
              },
              child: Container(
                height: 100,
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
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            assign,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
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
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            description,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
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
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            duedate,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
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
