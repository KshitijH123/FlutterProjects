import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  void setText(String value) {
    _text = value;
    notifyListeners();
  }
}
