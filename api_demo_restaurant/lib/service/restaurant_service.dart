import 'dart:convert';

import 'package:api_demo_restaurant/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  RestaurantService._();

  static final RestaurantService instance = RestaurantService._();

  static String baseUrl = 'http://192.168.29.73:3000/restaurants';

  Future<List<RestaurantModel>> fetchRestaurant() async {
    final responce = await http.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(responce.body);
      return jsonList.map((json) => RestaurantModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
