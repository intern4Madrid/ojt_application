import 'dart:convert';

import 'package:http/http.dart' as http;

class Login {
  Future<http.Response> login(String username, String password) async {
    try {
      String url = 'http://192.168.0.130:5000/api/login';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // "Access-Control-Allow-Origin": "*",
          // "Access-Control-Allow-Methods": "GET,POST,PUT",
        },
        body: jsonEncode({'Username': username, 'Password': password}),
      );

      print(response.body);

      return response;
    } catch (error) {
      print('Error during login request: $error');
      throw error;
    }
  }
}

// class Login {
//   Future<String> login({String? username, String? password}) async {
//     String url = "http://192.168.0.130:5000/api/login";
//     final response = await http.post(
//       Uri.parse(
//         url,
//       ),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(
//         <String, dynamic>{
//           "username": username,
//           "password": password,
//         },
//       ),
//     );
//     print("--------------");
//     print(response.body);
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       return "Server Error";
//     }
//   }
// }
