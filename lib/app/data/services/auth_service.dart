import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String isLoggedInKey = 'isLoggedIn';

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false; 
  }

  Future<void> clearLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(isLoggedInKey);
  }
}