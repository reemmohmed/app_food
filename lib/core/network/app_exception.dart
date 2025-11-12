
import 'package:app_food/core/network/api_error.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
   static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // في حالة إن الـ API رجّع response فيه message
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? 'An unknown error occurred';
      return ApiError(
        message: message.toString(),
        statusCode: statusCode,
      );
    }

    // في حالة إن الـ statusCode = 302 مثلاً
    if (statusCode == 302) {
      return ApiError(message: 'This Email Already Taken', statusCode: statusCode);
    }

    // لو نوع الخطأ من نوع DioError (timeouts مثلاً)
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout. Please check your internet connection", statusCode: statusCode);
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Request timeout. Please try again", statusCode: statusCode);
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Response timeout. Please try again", statusCode: statusCode);
      default:
        return ApiError(
          message: error.message ?? "An unexpected error occurred. Please try again",
          statusCode: statusCode,
        );
    }
  }
}