import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class AssignmentForm extends StatefulWidget {
  const AssignmentForm({super.key});

  @override
  State<AssignmentForm> createState() => _AssignmentFormState();
}

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
    decoration: InputDecoration(
      hintText: 'Assignment title',
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}
