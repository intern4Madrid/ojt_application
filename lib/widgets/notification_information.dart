import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class NotificationInformation extends StatefulWidget {
  const NotificationInformation({super.key});

  @override
  State<NotificationInformation> createState() =>
      _NotificationInformationState();
}

class _NotificationInformationState extends State<NotificationInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "Date:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "Descriptions:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
