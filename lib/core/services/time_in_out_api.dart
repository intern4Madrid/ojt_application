import 'dart:convert';

import 'package:http/http.dart' as http;

class TimeIn {
  Future<http.Response> timein(
      String date, String timeIn, String timeOut) async {
    try {
      String url = 'http://192.168.0.132:3000/calculate';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, dynamic>{
            'Date': date,
            'TimeIn': timeIn,
            'TimeOut': timeOut,
          },
        ),
      );
      return response;
    } catch (error) {
      print('Error during login request: $error');
      throw error;
    }
  }
}
