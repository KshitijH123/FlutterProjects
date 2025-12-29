import 'dart:convert';

import 'package:firebase_login_example/model/screen_model.dart';
import 'package:http/http.dart' as http;

class ProfileServices {
  ProfileServices._();

  static final ProfileServices instance = ProfileServices._();

  static const String baseUrl =
      'https://mocki.io/v1/92866ab6-9972-4a97-b365-3551e1941f5c';

  Future<ScreenModel?> fetchScreen() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return ScreenModel.fromJson(json['screen']);
    }
    return null;
  }
}
