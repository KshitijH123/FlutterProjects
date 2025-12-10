import 'dart:convert';

import 'package:firebase_login_example/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  ProductService._();

  static final ProductService instance = ProductService._();

  static const String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductsModel>> fetchProduct() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((json) => ProductsModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
