import 'package:app_food/features/home/model/Product_model.dart';
import 'package:app_food/features/home/model/category_model.dart';
import 'package:app_food/features/home/model/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());
  int currentPage = 1;
  bool hasMore = true;
  bool isFetching = false;

  List<Product> products = [];

  void refreshHome() {
    if (isFetching) return; // يمنع التكرار
    currentPage = 1;
    hasMore = true;
    products.clear();
    fetchCategories();
    fetchProducts();
  }

  void fetchCategories() async {
    try {
      emit(HomeCatogeryLoading());
      final categories = await repo.getCategories();
      emit(HomeCatogerySuccess(categories));
    } catch (e) {
      emit(HomeCatogeryFailure(e.toString()));
    }
  }

  Future<void> fetchProducts({String? category, String? search}) async {
    if (!hasMore || isFetching) return;

    isFetching = true;

    try {
      if (currentPage == 1) {
        emit(HomeProductLoading());
      }

      final newProducts = await repo.fetchProducts(
        category: category,
        search: search,
        page: currentPage,
        limit: 10,
      );

      if (newProducts.isEmpty) {
        hasMore = false;
      } else {
        products.addAll(newProducts);
        currentPage++;
      }

      emit(HomeProductSuccess(products));
    } catch (e) {
      emit(HomeProductFailure(e.toString()));
    } finally {
      isFetching = false;
    }
  }

 

  Future<void> fetchProductById(int id) async {
    try {
      emit(HomeProductLoading()); // تحميل
      final product = await repo.getProductById(id);
      emit(HomeProductDetailSuccess(product)); // بعث البيانات بعد التحميل
    } catch (e) {
      emit(HomeProductFailure(e.toString())); // خطأ في جلب المنتج
    }
  }
}
