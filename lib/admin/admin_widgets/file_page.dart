import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePages extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilePages({
    super.key,
    required this.files,
    required this.onOpenedFile,
  });

  @override
  State<FilePages> createState() => _FilePagesState();
}

class _FilePagesState extends State<FilePages> {
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
                  color: extension != 'pdf'
                      ? Colors.transparent
                      : Colors.red.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: extension != 'pdf'
                    ? Image.file(File('${file.path}'))
                    : Text(
                        '.$extension',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
