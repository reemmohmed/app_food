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
  List<Product> products = [];

  void refreshHome() {
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
    if (!hasMore) return;

    try {
      // مش لازم تبعتي HomeProductLoading لو جالنا صفحات إضافية
      final allProducts = await repo.fetchProducts(
        category: category,
        search: search,
        page: currentPage,
        limit: 10,
      );

      // لو الداتا كبيرة والـ API ما بيدعم pagination حقيقي
      // ممكن نعمل skip & take كحل مؤقت
      // final newProducts = allProducts.skip((currentPage - 1) * 10).take(10).toList();

      final newProducts = allProducts;

      if (newProducts.isEmpty) {
        hasMore = false;
      } else {
        products.addAll(newProducts);
        currentPage++;
      }

      emit(HomeProductSuccess(products));
    } catch (e) {
      emit(HomeProductFailure(e.toString()));
    }
  }

  // Future<void> fetchProducts({String? category, String? search}) async {
  //   if (!hasMore) return;

  //   try {
  //     // emit(HomeProductLoading());  <-- مش لازم هنا أثناء تحميل صفحات إضافية

  //     final newProducts = await repo.fetchProducts(
  //       category: category,
  //       search: search,
  //       page: currentPage,
  //       limit: 10,
  //     );

  //     if (newProducts.isEmpty) {
  //       hasMore = false;
  //     } else {
  //       currentPage++;
  //       products.addAll(newProducts);
  //     }

  //     emit(HomeProductSuccess(products));
  //   } catch (e) {
  //     emit(HomeProductFailure(e.toString()));
  //   }
  // }

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
