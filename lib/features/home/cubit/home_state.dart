part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
// Categories
class HomeCatogeryLoading extends HomeState {}
class HomeCatogerySuccess extends HomeState {
  final List<CategoryModel> categories;
  HomeCatogerySuccess(this.categories);
}
class HomeCatogeryFailure extends HomeState {
  final String error;
  HomeCatogeryFailure(this.error);
}

// Products
class HomeProductLoading extends HomeState {}
class HomeProductSuccess extends HomeState {
  final List<Product> products;
  HomeProductSuccess(this.products);
}
class HomeProductFailure extends HomeState {
  final String error;
  HomeProductFailure(this.error);
}
// Product details state
class HomeProductDetailSuccess extends HomeState {
  final Product product;
  HomeProductDetailSuccess(this.product);
}
