import 'dart:convert';

import 'package:firebase_login_example/model/recipes_model.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  RecipeService._();

  static final RecipeService instance = RecipeService._();

  static const String baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> list = json['recipes'];

      return list.map((e) => Recipe.fromJson(e)).toList();
    }
    return [];
  }
}
