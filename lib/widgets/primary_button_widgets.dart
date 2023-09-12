import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  PrimaryButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            Colors.red.shade900,
            Colors.red,
            Colors.red.shade200,
          ])),
      child: Text(
        buttonText,
        style: textButton.copyWith(color: kWhiteColor),
      ),
    );
  }
}
