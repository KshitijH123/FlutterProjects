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

  void login(String name, String email) {
    pref?.setBool(SharedPreferencesKey.isLoggedIn, true);
    pref?.setString(SharedPreferencesKey.name, name);
    pref?.setString(SharedPreferencesKey.email, email);
  }

  String? getUserName() => pref?.getString(SharedPreferencesKey.name);
  String? getUserEmail() => pref?.getString(SharedPreferencesKey.email);

  Future<bool> isUserLoggedIn() async {
    await initialize();
    return pref?.getBool(SharedPreferencesKey.isLoggedIn) ?? false;
  }

  void logout() {
    pref?.setBool(SharedPreferencesKey.isLoggedIn, false);
    pref?.setString(SharedPreferencesKey.name, '');
    pref?.setString(SharedPreferencesKey.email, '');
  }
}

abstract class SharedPreferencesKey {
  static const name = 'name';
  static const email = 'email';
  static const isLoggedIn = 'is_logged_in';
}

