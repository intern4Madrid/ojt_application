// void saveAssignment() async {
//   final url = Uri.parse('http://192.168.0.132:9000/api/add_task');
//   final response = await http.post(
//     url,
//     body: {
//       'assignment_title': 'Assignment Title',
//       'description': 'Assignment Description',
//       'duedate': 'Due Date',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     print('Task added successfully');
//   } else {
//     print('Failed to add task');
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojt_app/utils/getter_setter/save_assign_model.dart';

class saveAssignment {
  Future<http.Response> assigngment(
    int taskID,
    String assignmentTitle,
    String description,
    String duedate,
    String status,
  ) async {
    try {
      String url = 'http://192.168.0.132:9000/api/add_task';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          SaveAssignmentModel(
            taskID: taskID,
            assignmentTitle: assignmentTitle,
            description: description,
            duedate: duedate,
            status: status,
          ),
        ),
      );
      print('>>>>>>>ADD ASSIGNMENT<<<<<<<');
      print(response.body);
      return response;
    } catch (error) {
      print('Error during login request: $error');
      throw error;
    }
  }
}
