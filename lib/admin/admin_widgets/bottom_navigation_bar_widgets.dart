import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ojt_app/admin/admin_screen/calendar_screens.dart';
import 'package:ojt_app/admin/admin_screen/dtr_screens.dart';
import 'package:ojt_app/admin/admin_screen/home_screen_screens.dart';
import 'package:ojt_app/theme.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  PageController controller = PageController(initialPage: 0);
  final List<Widget> _widgetOption = <Widget>[
    HomeScreen(),
    DTR(),
    Calendar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        if (kDebugMode) {
          print(_currentIndex);
        }
      }
    });
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: _widgetOption,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        elevation: 8,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_outlined,
              color: Colors.white,
            ),
            label: 'Task',
            // backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_outlined,
              color: Colors.white,
            ),
            label: 'DTR',
            // backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
            label: 'Calendar',
            // backgroundColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
