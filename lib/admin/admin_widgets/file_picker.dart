import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ojt_app/admin/admin_widgets/file_page.dart';
import 'package:ojt_app/theme.dart';
import 'package:open_file/open_file.dart';

class FilePickerrrr extends StatefulWidget {
  const FilePickerrrr({super.key});

  @override
  State<FilePickerrrr> createState() => _FilePickerrrrState();
}

class _FilePickerrrrState extends State<FilePickerrrr> {
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: EdgeInsets.all(10),
            ),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['pdf', 'jpg', 'png', 'videos', 'zip'],
              );
              if (result == null) return;

              openFiles(result.files);
            },
            label: Text(
              "Upload file",
              style: TextStyle(fontSize: 17),
            ),
            icon: Icon(Icons.upload_file_outlined),
          ),
        ),
      ],
    );
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FilePage(
          files: files,
          onOpenedFile: openFile,
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
