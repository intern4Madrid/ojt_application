import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class FilePickerrrr extends StatefulWidget {
  const FilePickerrrr({super.key});

  @override
  State<FilePickerrrr> createState() => _FilePickerrrrState();
}

class _FilePickerrrrState extends State<FilePickerrrr> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
            },
            child: Text(
              "Upload file",
            ),
          ),
        ),
      ],
    );
  }
}
