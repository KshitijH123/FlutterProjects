import 'dart:convert';

import 'package:comment_api_demo/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentService {
  CommentService._();

  static final CommentService instance = CommentService._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<CommentModel>> fetchComments() async {
    final response = await http
        .get(
          Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
