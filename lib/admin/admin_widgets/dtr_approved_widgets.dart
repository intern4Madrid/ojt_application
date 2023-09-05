import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class DTRApproval extends StatefulWidget {
  const DTRApproval({super.key});

  @override
  State<DTRApproval> createState() => _DTRApprovalState();
}

class _DTRApprovalState extends State<DTRApproval> {
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
                label: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Time In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Time Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Remarks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text("John Eric Madrid"),
                  ),
                  DataCell(
                    Text("Date:"),
                  ),
                  DataCell(
                    Text("In:"),
                  ),
                  DataCell(
                    Text("Out:"),
                  ),
                  DataCell(
                    DropdownButton(
                      value: dropdownValue,
                      items: [
                        DropdownMenuItem(
                          value: 'Pending',
                          child: Center(
                            child: Text("Pending"),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Approved',
                          child: Center(
                            child: Text("Approved"),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Not Approved',
                          child: Center(
                            child: Text("Not Approved"),
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
