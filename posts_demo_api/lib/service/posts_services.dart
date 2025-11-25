import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_demo_api/model/posts_model.dart';

class PostsServices {
  PostsServices._();

  static final PostsServices instance = PostsServices._();

  static const String baseUrl = 'https://dummyjson.com/posts';

  Future<PostsResponce> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return PostsResponce.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('there is an error:');
    }
  }
}
