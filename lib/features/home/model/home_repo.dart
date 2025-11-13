import 'dart:developer';

import 'package:app_food/core/network/api_error.dart';
import 'package:app_food/core/network/api_service.dart';
import 'package:app_food/core/network/app_exception.dart';
import 'package:app_food/features/home/model/category_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
    ApiService apiService = ApiService();


  // get catogeries
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await apiService.get("/categories");
      final data = response['data'] as List;
      log("data Catogeries $data");
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
