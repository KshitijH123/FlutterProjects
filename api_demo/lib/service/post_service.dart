import 'dart:convert';
import 'package:api_demo/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  PostService._();
  static final PostService instance = PostService._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchPost() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
