import 'package:flutter/material.dart';

class DTRApproval extends StatefulWidget {
  const DTRApproval({super.key});

  @override
  State<DTRApproval> createState() => _DTRApprovalState();
}

class _DTRApprovalState extends State<DTRApproval> {
  @override
  Widget build(BuildContext context) {
    TableRow _1 = TableRow(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Name"),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Time in/out"),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Remarks"),
          ),
        ),
      ],
    );

    TableRow _2 = TableRow(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("John Eric E. Madrid"),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Time in:"),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Approved/Not"),
          ),
        ),
      ],
    );
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Table(
            columnWidths: {
              0: FractionColumnWidth(0.5),
              1: FractionColumnWidth(0.25),
              2: FractionColumnWidth(0.25),
            },
            border: TableBorder.all(),
            children: <TableRow>[
              _1,
              _2,
            ],
          ),
        ),
      ),
    );
  }
}
