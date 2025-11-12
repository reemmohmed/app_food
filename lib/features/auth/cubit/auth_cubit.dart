import 'dart:developer';
import 'package:app_food/core/network/api_error.dart';
import 'package:app_food/features/auth/data/auth_repo.dart';
import 'package:app_food/features/auth/data/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  UserModel? user; // حفظ بيانات المستخدم مؤقتًا
  bool isGuest = true;
  bool isLoadingUpdate = false;
  bool isLoadingLogout = false;
  String? selectedImage; // ✅ حفظ بيانات المستخدم مؤقتًا في الذاكرة

  AuthCubit(this.authRepo) : super(AuthInitial());

  // LOGIN
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login(email, password);
      this.user = user; // ✅ نخزنها محليًا
      emit(AuthSuccess(user!));
      log("loginSuccess    ${user.toString()}");
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  // REGISTER
  Future<void> register({
    required String name,
    required String email,
    required String password,
    String? phone,
    String? address,
    String? visa,
  }) async {
    emit(AuthLoading());
    try {
      final data = await authRepo.signup(name, email, password);
      user = data; // ✅ نخزنها محليًا
      emit(AuthSuccess(data!));
      log("register   ${data.toString()}");
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  Future<void> autoLogin() async {
    try {
      final userData = await authRepo.autoLogin();
      isGuest = authRepo.isGuest;
      if (userData != null) {
        user = userData;
        emit(AuthSuccess(userData));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(e is ApiError ? e.message : e.toString()));
    }
  }

  /// GET PROFILE
  Future<void> getProfileData() async {
    emit(AuthLoading());
    try {
      final fetchedUser = await authRepo.getProfileData();
      user = fetchedUser;
      emit(AuthSuccess(fetchedUser!));
      log("getProfileData: ${fetchedUser.toString()}");
    } catch (e) {
      emit(AuthFailure(e is ApiError ? e.message : "Error in Profile"));
    }
  }

  /// UPDATE PROFILE
  ///

  Future<void> updateProfileData({
    String? name,
    String? email,
    String? address,
    String? visa,
    String? imagePath,
  }) async {
    if (name == null || email == null || address == null) {
      emit(AuthFailure("Name, email and address are required"));
      return;
    }

    emit(AuthLoading());
    try {
      // final updatedUser = await authRepo.updateProfileData(
      //   name: name,
      //   email: email,
      //   address: address,
      //   visa: visa,
      //   imagePath: imagePath,
      // );
final updatedUser = await authRepo.updateProfileData(
  name: name,
  email: email,
  address: address,
  visa: visa,
  imagePath: imagePath,
);

if (updatedUser != null) {
  user = updatedUser;
  emit(AuthSuccess(updatedUser));
  log("updateProfileData: ${updatedUser.toString()}");
} else {
  emit(AuthFailure("Failed to update profile"));
}

      if (updatedUser != null) {
        user = updatedUser;
        emit(AuthSuccess(updatedUser));
        log("updateProfileData: ${updatedUser.toString()}");
      } else {
        emit(AuthFailure("Failed to update profile"));
      }
    } catch (e) {
      emit(AuthFailure(e is ApiError ? e.message : "Failed to update profile"));
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      user = null;
      isGuest = true;
      emit(AuthLoggedOut());
      log("logout success");
    } catch (e) {
      emit(AuthFailure(e is ApiError ? e.message : e.toString()));
    }
  }

  /// PICK IMAGE
  Future<void> pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        selectedImage = pickedImage.path;
        log("Picked image: $selectedImage");
      }
    } catch (e) {
      emit(AuthFailure("Failed to pick image"));
    }
  }
}
