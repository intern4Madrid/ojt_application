import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/assignment_task_admin.dart';
import 'package:ojt_app/widgets/list_students_task_widgets.dart';

class TaskAdmin extends StatefulWidget {
  const TaskAdmin({super.key});

  @override
  State<TaskAdmin> createState() => _TaskAdminState();
}

class _TaskAdminState extends State<TaskAdmin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.assignment_outlined,
                ),
                text: 'Assignment',
              ),
              Tab(
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                text: 'Students',
              ),
            ],
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: AssigmentTask(),
              ),
            ),
            Container(
              child: Center(
                child: ListOfStudents(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
