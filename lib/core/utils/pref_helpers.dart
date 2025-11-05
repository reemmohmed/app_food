import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _tokenKey = 'auth_token';
// save token when user regester in app
  static Future<void> saveToken(String token) async {
    final  prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }
//  static Future<void> saveUserRole(String role) async {
  static Future<String?> getToken() async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
// clear or cach  token when user is  a getOut for app 
  static Future<void> clearToken() async {
    final  prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}