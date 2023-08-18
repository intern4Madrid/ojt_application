import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class FilePicker extends StatefulWidget {
  const FilePicker({super.key});

  @override
  State<FilePicker> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {},
            child: Text(
              "Upload file",
            ),
          ),
        ),
      ],
    );
  }
}
