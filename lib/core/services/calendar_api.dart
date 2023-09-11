import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojt_app/utils/calendar_models.dart';
import 'package:ojt_app/utils/try_func.dart';

class CalendarApi {
  Future<http.Response> calendar(
    String title,
    String description,
  ) async {
    try {
      String url = 'http://192.168.0.132:6000/api/add_event';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          CalendarModels(
            title: title,
            description: description,
          ),
        ),
      );
      print('>>>>>>>ADD ASSIGNMENT<<<<<<<');
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final String calendartitle = responseData['title'] ?? '';
        TRY.setTitle(calendartitle);

        final String calendarDescription = responseData['description'] ?? '';
        TRY.setDescription(calendarDescription);

        print('>>>>>>>>TITLE: $calendartitle');
        print('>>>>>>>>DESCRIPTION: $calendarDescription');
      }

      return response;
    } catch (error) {
      print('Error during login request: $error');
      throw error;
    }
  }
}

// if (response.statusCode == 200) {
// final Map<String, dynamic> responseData = jsonDecode(response.body);
//
// final String firstname = responseData['firstName'];
// LoggedIn.setFirstName(firstname);
//
// final String lastname = responseData['lastName'];
// LoggedIn.setLastName(lastname);
//
// final String email = responseData['email'];
// LoggedIn.setEmail(email);
//
// final String phone = responseData['phone'];
// LoggedIn.setPhone(phone);
//
// final String password = responseData['password'];
// LoggedIn.setPassword(password);
//
// final String confirm_password = responseData['confirm_password'];
// LoggedIn.setConfirmPassword(confirm_password);
//
// final String userLevel = responseData['user_level'];
// LoggedIn.setUserLevel(userLevel);
//
// print('FIRSTNAME : $firstname');
// print('LASTNAME : $lastname');
// print('EMAIL : $email');
// print('PHONE : $phone');
// print('PASSWORD : $password');
// print('CONFIRM_PASSWORD : $confirm_password');
// print('USER_LEVEL : $userLevel');
// }

// if (response.statusCode == 200) {
//   final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//   final String firstname = responseData['firstName'];
//   LoggedIn.setFirstName(firstname);
//
//   final String lastname = responseData['lastName'];
//   LoggedIn.setLastName(lastname);
//
//   final String email = responseData['email'];
//   LoggedIn.setEmail(email);
//
//   final String phone = responseData['phone'];
//   LoggedIn.setPhone(phone);
//
//   final String password = responseData['password'];
//   LoggedIn.setPassword(password);
//
//   final String confirm_password = responseData['confirm_password'];
//   LoggedIn.setConfirmPassword(confirm_password);
//
//   final String userLevel = responseData['user_level'];
//   LoggedIn.setUserLevel(userLevel);
//
//   print('FIRSTNAME : $firstname');
//   print('LASTNAME : $lastname');
//   print('EMAIL : $email');
//   print('PHONE : $phone');
//   print('PASSWORD : $password');
//   print('CONFIRM_PASSWORD : $confirm_password');
//   print('USER_LEVEL : $userLevel');
// }

// class Login {
//   Future<String> login({String? username, String? password}) async {
//     String url = "http://127.0.0.1:5000/api/login";
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

// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class Calendar {
//   Future<http.Response> calendar(String title, String description) async {
//     try {
//       String url = 'http://192.168.0.132:6000/api/add_event';
//       final http.Response response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(
//           <String, dynamic>{
//             "title": title,
//             "Description": description,
//           },
//         ),
//       );
//       return response;
//     } catch (error) {
//       print('Error during addevent request: $error');
//       throw error;
//     }
//   }
// }
