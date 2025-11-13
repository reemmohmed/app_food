import 'package:app_food/features/home/model/category_model.dart';
import 'package:app_food/features/home/model/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitial());
  void fetchCategories() async {
    try {
      emit(HomeLoading());
      final categories = await repo.getCategories();
      emit(HomeSuccess(categories));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
