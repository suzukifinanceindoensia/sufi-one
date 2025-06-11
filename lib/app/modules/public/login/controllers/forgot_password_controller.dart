import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/services/auth_service.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final isButtonEnabled = true.obs;

  final AuthService _authService = AuthService();

  /// ----------------------------
  /// ========== VALIDATOR ==========
  /// ----------------------------

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  /// ----------------------------
  /// ========== RESET PASSWORD ==========
  /// ----------------------------

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    isButtonEnabled.value = false;
    final email = emailController.text.trim();

    try {
      final userExists = await _authService.sendOtp(email);

      if (userExists) {
        await Future.delayed(const Duration(seconds: 2)); // Simulasi loading
        Get.snackbar(
          'OTP Sent',
          'Simulasi OTP telah dikirim ke $email',
          snackPosition: SnackPosition.TOP,
        );
        Get.toNamed(HomeRoutes.resetpassword, arguments: {'email': email});
      } else {
        Get.snackbar(
          'Email Not Found',
          'Email tidak terdaftar',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isButtonEnabled.value = true;
    }
  }

  /// ----------------------------
  /// ========== LIFECYCLE ==========
  /// ----------------------------

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
