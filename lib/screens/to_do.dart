import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/assigned.dart';
import 'package:ojt_app/widgets/completed.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(90),
                child: Center(
                  child: Text(
                    "To-Do",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                icon: Icon(Icons.assignment),
                text: 'Assigned',
              ),
              Tab(
                icon: Icon(Icons.task),
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(child: AssignedTask()),
            ),
            Container(
              child: Center(
                child: Completed(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
