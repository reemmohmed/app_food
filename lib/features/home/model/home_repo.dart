import 'dart:developer';

import 'package:app_food/core/network/api_error.dart';
import 'package:app_food/core/network/api_service.dart';
import 'package:app_food/core/network/app_exception.dart';
import 'package:app_food/features/home/model/Product_model.dart';
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

  Future<List<Product>> fetchProducts({
    String? category,
    String? search,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiService.get(
        '/products',
        queryParameters: {
          if (category != null && category.isNotEmpty) 'category': category,
          if (search != null && search.isNotEmpty) 'search': search,
          'page': page,
          'limit': limit,
        },
      );

      final data = response['data'] as List;
      log("fetchProducts $data");
      return data.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await apiService.get('/products/$id');
      final data = response['data'];
      log(" getProductById $data");
      return Product.fromJson(data);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
