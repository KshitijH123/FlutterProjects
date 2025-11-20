import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_pai/model/store_model.dart';

class StoreService {
  StoreService._();

  static final StoreService instance = StoreService._();

  static const String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<StoreModel>> fetchStore() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => StoreModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
