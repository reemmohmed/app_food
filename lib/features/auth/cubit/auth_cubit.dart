import 'dart:developer';

import 'package:app_food/core/network/api_error.dart';
import 'package:app_food/features/auth/data/auth_repo.dart';
import 'package:app_food/features/auth/data/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  // LOGIN
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login({"email": email, "password": password});
      emit(AuthSuccess(user));
      log("loginSucsess    ${user.toString()}");
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message)); // ✅ يطبع رسالة السيرفر
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
      final data = await authRepo.register({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
        "visa": visa,
      });

      emit(AuthSuccess(data));
      log("register   ${data.toString()}");
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  // GET PROFILE
  Future<void> getProfile() async {
    emit(AuthLoading());
    try {
      final data = await authRepo.getProfile();
      emit(AuthSuccess(data));
      log("getProfile   ${data.toString()}");
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  // UPDATE PROFILE
  Future<void> updateProfile({
    String? name,
    String? email,
    String? image,
    String? address,
    String? visa,
  }) async {
    emit(AuthLoading());
    try {
      final data = {
        if (name != null) "name": name,
        if (email != null) "email": email,
        if (image != null) "image": image,
        if (address != null) "address": address,
        if (visa != null) "Visa": visa,
      };

      final user = await authRepo.updateProfile(data);
      emit(AuthSuccess(user));

    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  // LOGOUT
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(AuthLoggedOut());
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailure(e.message));
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }
}
