import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/controller/event_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWindow extends StatefulWidget {
  const CalendarWindow({super.key});

  @override
  State<CalendarWindow> createState() => _CalendarWindowState();
}

class _CalendarWindowState extends State<CalendarWindow> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime today = DateTime.now();

  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  EventController eventController = EventController();

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
              controller: eventController.titleController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: eventController.descpController,
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
              if (eventController.titleController.text.isEmpty &&
                  eventController.descpController.text.isEmpty) {
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
                print(eventController.titleController.text);
                print(eventController.descpController.text);

                setState(() {
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": eventController.titleController.text,
                      "eventDescp": eventController.descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": eventController.titleController.text,
                        "eventDescp": eventController.descpController.text,
                      }
                    ];
                  }
                });

                print(
                    "New event for backend developer ${json.encode(mySelectedEvents)}");
                eventController.titleController.clear();
                eventController.descpController.clear();
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
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.black,
                      ),
                    ),
                    leading: Icon(
                      Icons.event_note_outlined,
                      color: kPrimaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Event Title: ${myEvents['eventTitle']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Description:   ${myEvents['eventDescp']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.red.shade900,
              Colors.red,
              Colors.red.shade400,
            ],
          ),
        ),
        child: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () => _showAddEventDialog(),
          label: Text('Add event'),
        ),
      ),
    );
  }
}
