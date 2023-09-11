import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojt_app/utils/calendar_models.dart';

class DeleteApi {
  Future<http.Response> deleteEvent(
      String id, String title, String description) async {
    try {
      String url = 'http://192.168.0.132:6000/api/delete_event/$id';
      final http.Response response = await http.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          CalendarModels(
            taskId: 'id,',
            title: 'title',
            description: 'description',
          ),
        ),
      );
      return response;
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}

// class DeleteApi {
//   Future<http.Response> deleteEvent(String id, String title, String description)
//   async {
//     try {
//       String url = 'http://192.168.0.132:6000/api/delete_event/:id';
//       final http.Response response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(
//           CalendarModels(
//             title: title,
//             description: description,
//           ),
//         ),
//       );
//   }
// }
//
// }
