import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/admin_file_opener.dart';
import 'package:provider/provider.dart';

import '../../utils/getter_setter/taskkk_getter_setter.dart';

class AssigmentTask extends StatefulWidget {
  const AssigmentTask({super.key});

  @override
  State<AssigmentTask> createState() => _AssigmentTaskState();
}

class _AssigmentTaskState extends State<AssigmentTask> {
  String description = Taskkk.getDescription();
  String assign = Taskkk.getAssign();
  String duedate = Taskkk.getDueDate();
  String uploadfile = Taskkk.getUploadFile();
  String link = Taskkk.getLink();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AdminFileOpener>(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Due date:",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  duedate,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
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
                    fontSize: 18,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                !prov.isAdded
                    ? Container()
                    : Container(
                        child: prov.widget,
                      ),
                SizedBox(height: 100),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  "Link:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  link,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
