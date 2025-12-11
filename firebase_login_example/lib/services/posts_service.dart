import 'dart:convert';

import 'package:firebase_login_example/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsService {
  PostsService._();

  static final PostsService instance = PostsService._();

  static const String baseUrl = 'https://dummyjson.com/posts';
  

  Future<PostsResponse> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return PostsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('there is an error');
    }
  }
}
