import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class TimeInTimeOut extends StatelessWidget {
  const TimeInTimeOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimeInTimeOutPage(),
    );
  }
}

class TimeInTimeOutPage extends StatefulWidget {
  @override
  _TimeInTimeOutPageState createState() => _TimeInTimeOutPageState();
}

class _TimeInTimeOutPageState extends State<TimeInTimeOutPage> {
  List<String> timeInRecords = [];
  List<String> timeOutRecords = [];

  void recordTimeIn() {
    setState(() {
      timeInRecords.add(
        DateTime.now().toString(),
      );
    });
  }

  void recordTimeOut() {
    setState(() {
      timeOutRecords.add(
        DateTime.now().toString(),
      );
    });
  }

  calculatedTimeDifference(String timeIn, String timeOut) {
    if (timeIn.isEmpty || timeOut.isEmpty) {
      return '0:00;';
    }

    DateTime dateTimeIn = DateTime.parse(timeIn);
    DateTime dateTimeOut = DateTime.parse(timeOut);

    Duration duration = dateTimeOut.difference(dateTimeIn);

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                    ),
                    onPressed: recordTimeIn,
                    child: Text(
                      "Record Time In",
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                    ),
                    onPressed: recordTimeOut,
                    child: Text(
                      "Record Time Out",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text("Time In"),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text("Time Out"),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text("Durations"),
                          ),
                        ),
                      ],
                    ),
                    for (int i = 0; i < timeInRecords.length; i++)
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                timeInRecords[i],
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                timeOutRecords.length > i
                                    ? timeOutRecords[i]
                                    : '',
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                calculatedTimeDifference(
                                  timeInRecords[i],
                                  timeOutRecords.length > i
                                      ? timeOutRecords[i]
                                      : '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
