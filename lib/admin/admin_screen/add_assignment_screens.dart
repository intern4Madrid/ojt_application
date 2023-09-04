import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/admin/admin_widgets/bottom_navigation_bar_widgets.dart';
import 'package:ojt_app/admin/admin_widgets/file_picker.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/assignment_controller.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

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
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
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
              Padding(
                padding: EdgeInsets.all(10),
                child: FilePickerrrr(),
              ),
              SizedBox(
                height: 300,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          Taskkk.getAssign();
                          Taskkk.getDescription();
                          Taskkk.getDueDate();

                          print(Taskkk.getDueDate());
                          print(Taskkk.getDescription());
                          print(Taskkk.getAssign());

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigation(),
                            ),
                          );
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
