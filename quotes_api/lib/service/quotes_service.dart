import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_api/model/quotes_model.dart';

class QuotesService {
  QuotesService._();

  static final QuotesService instance = QuotesService._();

  static const String baseUrl = 'https://dummyjson.com/quotes';

  Future<List<QuotesModel>> fetchQuotes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List<dynamic> quotesJson = jsonBody['quotes'];

      return quotesJson.map((e) => QuotesModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

