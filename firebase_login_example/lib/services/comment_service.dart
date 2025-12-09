import 'dart:convert';

import 'package:firebase_login_example/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentService {
  CommentService._();

  static final CommentService instance = CommentService._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<CommentModel>> fetchComment() async {
    final responce = await http.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      final List<dynamic> json = jsonDecode(responce.body);
      return json.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
