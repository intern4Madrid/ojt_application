import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/User/user_widgets/user_bottom_navigation_bar_widgets.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/user_add_timein_out.dart';
import 'package:ojt_app/utils/getter_setter/user_timeinout_getter_setter.dart';

class UserAddTime extends StatefulWidget {
  const UserAddTime({super.key});

  @override
  State<UserAddTime> createState() => _UserAddTimeState();
}

TimeController timeController = TimeController();

class _UserAddTimeState extends State<UserAddTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: timeController.dateController,
              onChanged: (value) {
                Time.setDate(
                    value); // This might need to be adjusted based on your requirements
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Select Date',
                labelStyle: const TextStyle(
                    fontStyle: FontStyle.italic, letterSpacing: 1.5),
              ),
              onTap: () async {
                DateTime? datetime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if (datetime != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(datetime);
                  setState(() {
                    timeController.dateController.text = formattedDate;
                  });
                  Time.setDate(
                      formattedDate); // Pass the formatted date as a string
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                Time.setTimeIn(value);
              },
              controller: timeController.timeinController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.timer_outlined,
                  color: Colors.black,
                ),
                labelText: 'Time In',
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                hintText: 'Enter Time',
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                Time.setTimeOut(value);
              },
              controller: timeController.timeoutController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.timer_outlined,
                  color: Colors.black,
                ),
                labelText: 'Time Out',
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                hintText: 'Enter Time',
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                Time.setTotal(value);
              },
              controller: timeController.totalController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.timer_rounded,
                  color: Colors.black,
                ),
                labelText: 'Total',
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                hintText: 'Total Time',
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.red.shade900,
                Colors.red,
                Colors.red.shade400,
              ],
            ),
          ),
          height: 50,
          width: 340,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Time.getDate();
              Time.getTimeIn();
              Time.getTimeOut();
              Time.getTotal();

              print(Time.getDate());
              print(Time.getTimeIn());
              print(Time.getTimeOut());
              print(Time.getTotal());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserBottomNavigation(),
                ),
              );
            },
            child: Text(
              'Post',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
