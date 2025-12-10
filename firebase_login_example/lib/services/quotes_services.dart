import 'dart:convert';

import 'package:firebase_login_example/model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesServices {
  QuotesServices._();

  static final QuotesServices instance = QuotesServices._();

  static const String baseUrl = 'https://dummyjson.com/quotes';

  Future<List<QuotesModel>> fetchQuote() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List<dynamic> quotejson = jsonBody['quotes'];

      return quotejson.map((e) => QuotesModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
