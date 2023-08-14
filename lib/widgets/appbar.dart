import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class AppBarSection extends StatefulWidget {
  const AppBarSection({super.key});

  @override
  State<AppBarSection> createState() => _AppBarSectionState();
}

class _AppBarSectionState extends State<AppBarSection> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(80),
            child: Center(
              child: Text(
                "TrainEase",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
