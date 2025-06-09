import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/auth/controllers/auth_controller.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class LoginController extends GetxController {
  /// ----------------------------
  /// ========== FORM & STATE ==========
  /// ----------------------------

  final _loginKey = GlobalKey<FormState>(); // Key untuk form login
  GlobalKey<FormState> get loginKey => _loginKey;

  final emailController = TextEditingController(); // Controller input email
  final passwordController =
      TextEditingController(); // Controller input password

  final isPasswordVisible = false.obs; // Untuk toggle visibility password

  final authController =
      Get.find<AuthController>(); // Ambil instance AuthController

  /// ----------------------------
  /// ========== VALIDATOR ==========
  /// ----------------------------

  String? validateEmail(String? value) {
    // Validasi input email
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    // Validasi input password
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  /// ----------------------------
  /// ========== ACTION ==========
  /// ----------------------------

  void togglePasswordVisibility() {
    // Ubah visibilitas password (obscured/tidak)
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    // Fungsi login
    if (!_loginKey.currentState!.validate()) return; // Validasi form

    try {
      await authController.login(
        emailController.text.trim(), // Ambil dan bersihkan email
        passwordController.text.trim(), // Ambil dan bersihkan password
      );

      if (authController.isLoggedIn) {
        // Jika login sukses, navigasi ke halaman profile
        Get.snackbar('Success', 'Login berhasil!');
        Get.offAllNamed(HomeRoutes.profilePage);
      }
    } catch (e) {
      // Tampilkan error jika login gagal
      Get.snackbar(
        'Login Gagal',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  /// ----------------------------
  /// ========== LIFECYCLE ==========
  /// ----------------------------

  @override
  void onClose() {
    // Dispose controller saat tidak digunakan
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
