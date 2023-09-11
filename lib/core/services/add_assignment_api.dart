import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojt_app/utils/save_assign_model.dart';

class saveAssignment {
  Future<http.Response> assignment(
    String taskID,
    String assignmentTitle,
    String description,
    String duedate,
    String status,
    String link,
    // String uploadFile,
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
            link: link,
            // uploadFile: uploadFile,
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
