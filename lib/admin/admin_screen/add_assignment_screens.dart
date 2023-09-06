import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/admin/admin_widgets/add_assignment_post_button.dart';
import 'package:ojt_app/admin/admin_widgets/file_picker.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/assignment_controller.dart';
import 'package:ojt_app/utils/getter_setter/file_opener.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';
import 'package:provider/provider.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({
    super.key,
  });

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

AssignmentController assignmentController = AssignmentController();

class _AddAssignmentState extends State<AddAssignment> {
  DateTime selectDate = DateTime.now();
  List<String> _emailAddresses = [];

  void _addEmails() {
    final inputText = assignmentController.email.text.trim();
    final emails = inputText.split(RegExp(r'[;,]'));

    setState(() {
      _emailAddresses.addAll(emails.where((email) => email.isNotEmpty));
      assignmentController.email.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FileOpener>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(60),
              child: Center(
                child: Text(
                  "Add assignment",
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
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: assignmentController.assign,
                onChanged: (value) {
                  Taskkk.setAssign(value);
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter your title',
                  labelStyle: const TextStyle(
                      fontStyle: FontStyle.italic, letterSpacing: 1.5),
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  prefixIcon: Icon(
                    Icons.title_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: assignmentController.description,
                onChanged: (value) {
                  Taskkk.setDescription(value);
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter your description',
                  labelStyle: const TextStyle(
                      fontStyle: FontStyle.italic, letterSpacing: 1.5),
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  prefixIcon: Icon(
                    Icons.pages_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: assignmentController.duedate,
                onChanged: (value) {
                  Taskkk.setDueDate(
                      value); // This might need to be adjusted based on your requirements
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Select Date',
                  labelStyle: const TextStyle(
                      fontStyle: FontStyle.italic, letterSpacing: 1.5),
                ),
                onTap: () async {
                  DateTime? datetime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  );

                  if (datetime != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(datetime);
                    setState(() {
                      assignmentController.duedate.text = formattedDate;
                    });
                    Taskkk.setDueDate(
                        formattedDate); // Pass the formatted date as a string
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: assignmentController.email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Enter Emails(separated by , or ;)',
                        hintText: 'Add Email',
                        labelStyle: const TextStyle(
                            fontStyle: FontStyle.italic, letterSpacing: 1.5),
                        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.shade900,
                          Colors.red,
                          Colors.red.shade400,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: _addEmails,
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emails Added:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              children: _emailAddresses.map((email) {
                return Chip(
                  backgroundColor: Colors.red.shade100,
                  label: Text(email),
                  onDeleted: () {
                    setState(() {
                      _emailAddresses.remove(email);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: FilePickerrrr(),
            ),
            !prov.isAdded
                ? Container()
                : Container(
                    child: prov.widget,
                  )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: PostButton(),
      ),
    );
  }
}
