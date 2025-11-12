import 'package:app_food/core/network/app_exception.dart';
import 'package:app_food/core/network/dio_clint.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final DioClint _dioClient = DioClint();

  /// دالة مساعدة تجيب التوكن من SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  /// GET
  Future<dynamic> get(String endPoint) async {
    try {
      final token = await _getToken();
      final response = await _dioClient.dio.get(
        endPoint,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }

  /// POST
  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final token = await _getToken();
      final response = await _dioClient.dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }

  /// PUT
  Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final token = await _getToken();
      final response = await _dioClient.dio.put(
        endPoint,
        data: body,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }

  /// DELETE
  Future<dynamic> delete(String endPoint, dynamic body) async {
    try {
      final token = await _getToken();
      final response = await _dioClient.dio.delete(
        endPoint,
        data: body,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }
}
