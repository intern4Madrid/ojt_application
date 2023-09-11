import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ojt_app/core/services/delete_event_api.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/try_func.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/services/calendar_api.dart';

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
  final id = TextEditingController();

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  String descTitle = TRY.getTitle();

  _showAddEventDialog() async {
    CalendarApi calendarapi = CalendarApi();
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
            onPressed: () async {
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
                try {
                  final response = await calendarapi.calendar(
                    titleController.text,
                    descpController.text,
                  );

                  if (response.statusCode == 200) {
                  } else {
                    print("API error: ${response.statusCode}");
                  }
                } catch (error) {
                  print('Error during API request: $error');
                }

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
    DeleteApi deleteEvent = DeleteApi();
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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete'),
                                  content: Text(
                                      'Are you sure you want to delete this event?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        String eventId = myEvents['eventId'];
                                        try {
                                          final response =
                                              await deleteEvent.deleteEvent(
                                            id.text,
                                            titleController.text,
                                            descpController.text,
                                          );
                                          if (response.statusCode == 200) {
                                            setState(() {
                                              _listOfDayEvents(_selectedDate!)
                                                  .remove(myEvents);
                                            });
                                            Navigator.of(context).pop();
                                          } else {
                                            print(
                                                "API error: ${response.statusCode}");
                                          }
                                        } catch (error) {
                                          print(
                                              'Error during API request: $error');
                                        }
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.black,
                          ),
                        ),
                        leading: Icon(
                          Icons.event_note_outlined,
                          color: Colors.black,
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Event Title: $descTitle',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                        ),
                        subtitle: Text(
                          'Description:   ${myEvents['eventDescp']}',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
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
          label: Text(
            'Add event',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

// void deleteEvent(DateTime selectedDate, String eventTitle) {
//   setState(() {
//     if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(selectedDate)] !=
//         null) {
//       mySelectedEvents[DateFormat('yyyy-MM-dd').format(selectedDate)]!
//           .removeWhere((event) => event['eventTitle'] == eventTitle);
//     }
//   });
//   Navigator.of(context).pop();
// }
}
