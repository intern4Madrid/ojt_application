import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
              ),
              onPressed: () {},
              child: const Text(
                "Upload file",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
