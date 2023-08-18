import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/widgets/assignment_form.dart';
import 'package:ojt_app/widgets/bottom_navigation_bar_admin.dart';
import 'package:ojt_app/widgets/file_picker.dart';
import 'package:ojt_app/widgets/primary_button.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
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
              padding: EdgeInsets.all(73),
              child: Center(
                child: Text(
                  "Assignment",
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
                child: AssignmentForm(),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? datetime = await showDatePicker(
                          context: context,
                          initialDate: selectDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );
                        if (datetime != null) {
                          setState(
                            () {
                              selectDate = datetime;
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                      ),
                      child: Text(
                        "Due date",
                      ),
                    ),
                    Text(
                      "${selectDate.month} - ${selectDate.day} - ${selectDate.year}",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: kDefaultPadding,
                child: FilePicker(),
              ),
              SizedBox(
                height: 450,
              ),
              Padding(
                padding: kDefaultPadding,
                child: GestureDetector(
                    onTap: () {
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
