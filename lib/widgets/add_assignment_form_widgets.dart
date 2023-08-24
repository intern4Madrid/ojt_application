import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/assignment_controller.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

class AssignmentForm extends StatefulWidget {
  const AssignmentForm({super.key});

  @override
  State<AssignmentForm> createState() => _AssignmentFormState();
}

AssignmentController assignmentController = AssignmentController();

class _AssignmentFormState extends State<AssignmentForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTextFormField(),
          buildTextFormField2(),
        ],
      ),
    );
  }
}

buildTextFormField2() {
  return TextFormField(
    controller: assignmentController.description,
    onChanged: (value) {
      Taskkk.setDescription(value);
    },
    decoration: InputDecoration(
      hintText: 'Description',
      prefixIcon: Icon(Icons.description_outlined),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}

buildTextFormField() {
  return TextFormField(
    controller: assignmentController.assign,
    onChanged: (value) {
      Taskkk.setAssign(value);
    },
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.assignment_outlined),
      hintText: 'Assignment title',
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}
