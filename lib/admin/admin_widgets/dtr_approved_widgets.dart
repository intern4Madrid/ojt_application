import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/loggedin_getter_setter.dart';
import 'package:ojt_app/utils/getter_setter/user_timeinout_getter_setter.dart';

class DTRApproval extends StatefulWidget {
  const DTRApproval({super.key});

  @override
  State<DTRApproval> createState() => _DTRApprovalState();
}

class _DTRApprovalState extends State<DTRApproval> {
  String Email = LoggedIn.getEmail();
  String In = Time.getTimeIn();
  String Out = Time.getTimeOut();
  String Date = Time.getDate();
  String Total = Time.getTotal();
  String dropdownValue = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Time In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Time Out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.timer_rounded,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Total Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    Icon(
                      Icons.approval,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Remarks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(Email),
                  ),
                  DataCell(
                    Text(Date),
                  ),
                  DataCell(
                    Text(In),
                  ),
                  DataCell(
                    Text(Out),
                  ),
                  DataCell(
                    Text(Total),
                  ),
                  DataCell(
                    DropdownButton(
                      value: dropdownValue,
                      items: [
                        DropdownMenuItem(
                          value: 'Pending',
                          child: Center(
                            child: Text(
                              "Pending",
                              style: TextStyle(
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Approved',
                          child: Center(
                            child: Text(
                              "Approved",
                              style: TextStyle(
                                color: Colors.green.shade900,
                              ),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Not Approved',
                          child: Center(
                            child: Text(
                              "Not Approved",
                              style: TextStyle(
                                color: Colors.red.shade900,
                              ),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
