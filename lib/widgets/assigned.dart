import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class AssignedTask extends StatefulWidget {
  const AssignedTask({super.key});

  @override
  State<AssignedTask> createState() => _AssignedTaskState();
}

class _AssignedTaskState extends State<AssignedTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title:",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        "Due date:",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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
