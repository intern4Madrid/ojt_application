import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ojt_app/admin/admin_widgets/bottom_navigation_bar_widgets.dart';

class AdminLoadingScreen extends StatefulWidget {
  @override
  _AdminLoadingScreenState createState() => _AdminLoadingScreenState();
}

class _AdminLoadingScreenState extends State<AdminLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
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
            'https://lottie.host/c0fa7a00-30e4-4c0b-9968-13ded893b96c/7e8yL4WSpY.json',
            animate: true,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
