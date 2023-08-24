import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';
import 'package:ojt_app/widgets/add_assignment_form_widgets.dart';
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
                child: AssignmentForm(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: kDefaultPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
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
                        padding: EdgeInsets.all(10),
                      ),
                      label: Text(
                        "Due date",
                        style: TextStyle(fontSize: 17),
                      ),
                      icon: Icon(Icons.calendar_today_outlined),
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
              SizedBox(height: 10),
              Padding(
                padding: kDefaultPadding,
                child: FilePickerrrr(),
              ),
              SizedBox(
                height: 440,
              ),
              Padding(
                padding: kDefaultPadding,
                child: GestureDetector(
                    onTap: () {
                      Taskkk.getAssign();
                      Taskkk.getDescription();
                      Taskkk.getDueDate();
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
