import 'dart:convert';

import 'package:firebase_login_example/model/todos_model.dart';
import 'package:http/http.dart' as http;

class TodosServices {
  TodosServices._();

  static final TodosServices instance = TodosServices._();

  static const String baseUrl = 'https://dummyjson.com/todos';

  Future<List<TodosModel>> fetchTodos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> list = json['todos'];

      return list.map((e) => TodosModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
