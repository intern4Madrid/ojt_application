import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class UserCalendarWindow extends StatefulWidget {
  const UserCalendarWindow({super.key});

  @override
  State<UserCalendarWindow> createState() => _UserCalendarWindowState();
}

class _UserCalendarWindowState extends State<UserCalendarWindow> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime today = DateTime.now();

  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add new event",
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          TextButton(
            child: Text(
              "Add",
              style: TextStyle(color: kPrimaryColor),
            ),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Required title and description",
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                setState(() {
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                      }
                    ];
                  }
                });

                print(
                    "New event for backend developer ${json.encode(mySelectedEvents)}");
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(3000),
              locale: "en_US",
              rowHeight: 50,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: kPrimaryColor,
                ),
              ),
              availableGestures: AvailableGestures.all,
              onDaySelected: (selectedDay, today) {
                if (!isSameDay(_selectedDate, selectedDay)) {
                  setState(() {
                    _selectedDate = selectedDay;
                    today = today;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(
                    () {
                      _calendarFormat = format;
                    },
                  );
                }
              },
              onPageChanged: (today) {
                today = today;
              },
              eventLoader: _listOfDayEvents,
            ),
            if (_selectedDate != null)
              ..._listOfDayEvents(_selectedDate!).map(
                (myEvents) => SingleChildScrollView(
                  child: ListTile(
                    leading: Icon(
                      Icons.event_note_outlined,
                      color: kPrimaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text('Event Title: ${myEvents['eventTitle']}'),
                    ),
                    subtitle: Text('Description:   ${myEvents['eventDescp']}'),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 8,
        backgroundColor: kPrimaryColor,
        onPressed: () => _showAddEventDialog(),
        label: Text('Add event'),
      ),
    );
  }
}
