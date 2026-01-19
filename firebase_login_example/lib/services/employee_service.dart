import 'dart:convert';

import 'package:firebase_login_example/model/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  EmployeeService._();

  static final EmployeeService instance = EmployeeService._();

  static const String baseUrl = 'https://dummyjson.com/auth/login';

 static Future<EmployeeModel?> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "password": password,
        "expiresInMins": 30,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return EmployeeModel.fromJson(data);
    } else {
      return null;
    }
  }
}
