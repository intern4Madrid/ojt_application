import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojt_app/utils/models.dart';

class CreateUserAPI {
  Future<http.Response> adduser(
      String firstname,
      String lastname,
      String email,
      String phone,
      String password,
      String confirmPassword,
      String userLevel) async {
    try {
      String url = 'http://192.168.0.132:5000/api/create_user';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          CreateUserModel(
            firstname: firstname,
            lastname: lastname,
            email: email,
            phone: phone,
            password: password,
            confirmPassword: confirmPassword,
            userLevel: userLevel,
          ),
        ),
      );
      print('API CREATING USER CALLED');
      print(response.body);
      return response;
    } catch (error) {
      print('Error during login request: $error');
      throw error;
    }
  }
}
