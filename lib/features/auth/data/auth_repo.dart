import 'package:app_food/core/network/api_error.dart';
import 'package:app_food/core/network/api_service.dart';
import 'package:app_food/features/auth/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  // LOGIN
  Future<User> login(Map<String, dynamic> data) async {
    final response = await apiService.post('/login', data);

    // ✅ تحقق أن النتيجة مش ApiError
    if (response is ApiError) {
      throw response; // نرمي الخطأ علشان يوصلك في Cubit
    }

    final user = User.fromJson(response['data']);
    await saveToken(user.token);
    return user;
  }

  // REGISTER
  Future<User> register(Map<String, dynamic> data) async {
    final response = await apiService.post('/register', data);

    if (response is ApiError) {
      throw response;
    }

    final user = User.fromJson(response['data']);
    await saveToken(user.token);
    return user;
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      final response = await apiService.post('/logout', {});
      if (response is! ApiError) {
        await clearToken();
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  // GET PROFILE
  Future<User> getProfile() async {
    final response = await apiService.get('/profile');

    if (response is ApiError) {
      throw response;
    }

    return User.fromJson(response['data']);
  }

  // UPDATE PROFILE
  Future<User> updateProfile(Map<String, dynamic> data) async {
    final response = await apiService.post('/update-profile', data);

    if (response is ApiError) {
      throw response;
    }

    return User.fromJson(response['data']);
  }

  // 🔒 TOKEN STORAGE
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
