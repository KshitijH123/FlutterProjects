import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._() {
    initialize();
  }

  static final LocalStorage instance = LocalStorage._();

  SharedPreferences? pref;

  Future<void> initialize() async {
    pref ??= await SharedPreferences.getInstance();
  }

  String? getUserName() {
    return pref?.getString(SharedPreferencesKey.username);
  }

  void login(String username) {
    pref?.setBool(SharedPreferencesKey.isLoggedIn, true);

    pref?.setString(SharedPreferencesKey.username, username);
  }

  Future<bool> isUserLoggedIn() async {
    await initialize();
    return pref?.getBool(SharedPreferencesKey.isLoggedIn) ?? false;
  }

  void logout() {
    pref?.setBool(SharedPreferencesKey.isLoggedIn, false);

    pref?.setString(SharedPreferencesKey.username, '');
  }
}

abstract class SharedPreferencesKey {
  static const username = 'username';
  static const isLoggedIn = 'is_logged_in';
}
