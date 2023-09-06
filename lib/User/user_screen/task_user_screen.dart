import 'package:flutter/material.dart';
import 'package:ojt_app/User/user_widgets/user_filepicker.dart';
import 'package:ojt_app/User/user_widgets/user_submit_button.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';
import 'package:provider/provider.dart';

import '../../utils/getter_setter/user_file_opener.dart';

class TaskUser extends StatefulWidget {
  const TaskUser({super.key});

  @override
  State<TaskUser> createState() => _TaskUserState();
}

class _TaskUserState extends State<TaskUser> {
  String description = Taskkk.getDescription();
  String assign = Taskkk.getAssign();
  String duedate = Taskkk.getDueDate();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserFileOpener>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
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
                    width: 190,
                  ),
                  Text(
                    'Missing',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Text(
                duedate,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Assignment title:",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 5),
              Text(
                assign,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
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
              SizedBox(width: 5),
              Text(
                description,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                "Attachments:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: UserFilePickerrrr(),
              ),
              !prov.isAdded
                  ? Container()
                  : Container(
                      child: prov.widget,
                    ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SubmitButton(),
      ),
    );
  }
}
