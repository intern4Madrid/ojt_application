import 'package:flutter/material.dart';
import 'package:ojt_app/User/user_screen/user_add_timein_out.dart';
import 'package:ojt_app/theme.dart';
import 'package:ojt_app/utils/getter_setter/user_timeinout_getter_setter.dart';

class AddTimeIn_Out extends StatefulWidget {
  const AddTimeIn_Out({super.key});

  @override
  State<AddTimeIn_Out> createState() => _AddTimeIn_OutState();
}

class _AddTimeIn_OutState extends State<AddTimeIn_Out> {
  String date = Time.getDate();
  String timein = Time.getTimeIn();
  String timeout = Time.getTimeOut();
  String total = Time.getTotal();
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
              DataColumn(
                label: Text(
                  "",
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
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      timein,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      timeout,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      total,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text('Remarks'),
                  ),
                  DataCell(
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade600,
                            Colors.red,
                            Colors.red.shade400,
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Text("Submit"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserAddTime(),
                ),
              );
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            label: Icon(Icons.add_outlined),
          ),
        ),
      ),
    );
  }
}
