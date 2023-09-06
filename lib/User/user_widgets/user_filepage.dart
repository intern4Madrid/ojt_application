import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:open_file/open_file.dart';

class FilePagesUser extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilePagesUser({
    super.key,
    required this.files,
    required this.onOpenedFile,
  });

  @override
  State<FilePagesUser> createState() => _FilePagesUserState();
}

class _FilePagesUserState extends State<FilePagesUser> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          final files = widget.files[index];
          return buildListFile(files);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      ),
    );
  }

  buildListFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    final extension = file.extension ?? 'none';

    return InkWell(
      onTap: () => OpenFile.open(file.path!),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.file(File('${file.path}'))
                  /*Text(
                  '.$extension',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),*/
                  ),
            ),
            SizedBox(height: 8),
            Text(
              file.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              size,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
