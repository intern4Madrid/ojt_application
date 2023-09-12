import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ojt_app/User/user_widgets/user_bottom_navigation_bar_widgets.dart';

class UserLoadingScreen extends StatefulWidget {
  @override
  _UserLoadingScreenState createState() => _UserLoadingScreenState();
}

class _UserLoadingScreenState extends State<UserLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserBottomNavigation()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 2,
            colors: [
              Colors.white,
              Colors.red.shade200,
              Colors.red,
            ],
          ),
        ),
        child: Center(
          child: Lottie.network(
            'https://lottie.host/0bda541e-4316-4d8c-b62a-7c03a69d2666/Q6daOhiy8C.json',
            animate: true,
            width: 500,
            height: 500,
          ),
        ),
      ),
    );
  }
}
