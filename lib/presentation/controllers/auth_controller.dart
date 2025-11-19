import 'package:get/get.dart';
import 'package:fanpulse/core/repositories/auth_repository.dart';
import 'package:fanpulse/core/constants/app_constants.dart';
import 'package:fanpulse/core/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository(
    SupabaseService.to.client,
  );

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;
  final RxString selectedFavoriteClub = ''.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void selectFavoriteClub(String club) {
    selectedFavoriteClub.value = club;
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _authRepository.login(email: email, password: password);
      Get.offAllNamed(AppConstants.homeRoute);
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      isLoading.value = true;
      await _authRepository.signup(
        email: email,
        password: password,
        name: name,
      );
      Get.offAllNamed(AppConstants.homeRoute);
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword(String email) async {
    // TODO: Implement password reset
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }

  Future<void> loginWithGoogle() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }

  Future<void> loginWithApple() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }

  Future<void> logout() async {
    await _authRepository.logout();
    Get.offAllNamed(AppConstants.loginRoute);
  }
}
