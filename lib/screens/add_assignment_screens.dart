import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/assignment_controller.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';
import 'package:ojt_app/widgets/bottom_navigation_bar_widgets.dart';
import 'package:ojt_app/widgets/file_picker.dart';
import 'package:ojt_app/widgets/primary_button_widgets.dart';

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
                padding: kDefaultPadding,
                child: TextFormField(
                  controller: assignmentController.assign,
                  onChanged: (value) {
                    Taskkk.setAssign(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: kDefaultPadding,
                child: TextFormField(
                  controller: assignmentController.description,
                  onChanged: (value) {
                    Taskkk.setDescription(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: kDefaultPadding,
                child: TextFormField(
                  controller: assignmentController.duedate,
                  onChanged: (value) {
                    Taskkk.setDueDate(
                        value); // This might need to be adjusted based on your requirements
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Select Date',
                    labelStyle: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
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
                // TextFormField(
                //   controller: assignmentController.duedate,
                //   onChanged: (value) {
                //     Taskkk.setDueDate(value);
                //   },
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(
                //       Icons.calendar_today_outlined,
                //       color: kPrimaryColor,
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     labelText: 'Select Date',
                //     labelStyle: TextStyle(
                //       color: kPrimaryColor,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 25,
                //     ),
                //   ),
                //   onTap: () async {
                //     DateTime? datetime = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2000),
                //         lastDate: DateTime(3000));
                //
                //     if (datetime != null) {
                //       setState(() {
                //         assignmentController.duedate.text =
                //             DateFormat('yyyy-MM-dd').format(datetime);
                //       });
                //       Taskkk.setDueDate(datetime);
                //     }
                //   },
                // ),
              ),
              // SizedBox(height: 10),
              // Padding(
              //   padding: kDefaultPadding,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       ElevatedButton.icon(
              //         onPressed: () async {
              //           final DateTime? datetime = await showDatePicker(
              //             context: context,
              //             initialDate: selectDate,
              //             firstDate: DateTime(2000),
              //             lastDate: DateTime(3000),
              //           );
              //           if (datetime != null) {
              //             setState(
              //               () {
              //                 selectDate = datetime;
              //               },
              //             );
              //           }
              //         },
              //         style: ElevatedButton.styleFrom(
              //           primary: kPrimaryColor,
              //           padding: EdgeInsets.all(10),
              //         ),
              //         label: Text(
              //           "Due date",
              //           style: TextStyle(fontSize: 17),
              //         ),
              //         icon: Icon(Icons.calendar_today_outlined),
              //       ),
              //       Text(
              //         "${selectDate.month} - ${selectDate.day} - ${selectDate.year}",
              //         style: TextStyle(
              //           fontStyle: FontStyle.normal,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10),
              Padding(
                padding: kDefaultPadding,
                child: FilePickerrrr(),
              ),
              SizedBox(
                height: 360,
              ),
              Padding(
                padding: kDefaultPadding,
                child: GestureDetector(
                    onTap: () {
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
                    child: PrimaryButton(buttonText: "Post Assignment")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
