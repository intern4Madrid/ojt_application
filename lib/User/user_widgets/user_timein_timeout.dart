import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class AddTimeIn_Out extends StatefulWidget {
  const AddTimeIn_Out({super.key});

  @override
  State<AddTimeIn_Out> createState() => _AddTimeIn_OutState();
}

class _AddTimeIn_OutState extends State<AddTimeIn_Out> {
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
                  "Total",
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'In',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Out',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Total',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  DataCell(
                    Text('Remarks'),
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
