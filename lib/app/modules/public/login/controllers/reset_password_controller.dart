import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sufi_one/app/auth/services/auth_service.dart';

class ResetPasswordController extends GetxController {
  /// ----------------------------
  /// ========== FORM & STATE ==========
  /// ----------------------------

  final newPasswordController = TextEditingController(); // Input password baru
  final confirmPasswordController =
      TextEditingController(); // Konfirmasi password baru
  final formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();
  late String email;

  RxBool isNewPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  /// ----------------------------
  /// ========== INIT ==========
  /// ----------------------------

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email']; // Ambil email dari Get.arguments
  }

  /// ----------------------------
  /// ========== ACTION ==========
  /// ----------------------------

  void changePassword() async {
    // Validasi form
    if (formKey.currentState!.validate()) {
      // Cek apakah konfirmasi password cocok
      if (newPasswordController.text != confirmPasswordController.text) {
        Get.snackbar('Error', 'Konfirmasi password tidak cocok');
        return;
      }

      await _authService.loadDummyUsers(); // Load data dummy user
      final dummyUsers = _authService.dummyUsers;

      // Cari user berdasarkan email
      final index = dummyUsers.indexWhere((user) => user['email'] == email);
      if (index != -1) {
        // Update password jika user ditemukan
        dummyUsers[index]['password'] = newPasswordController.text;
        GetStorage().write('dummyUsers', dummyUsers); // Simpan ke storage

        Get.snackbar('Success', 'Password berhasil diubah');
        Get.offAllNamed('/login'); // Redirect ke halaman login
      } else {
        Get.snackbar('Error', 'User tidak ditemukan');
      }
    }
  }

  /// ----------------------------
  /// ========== LIFECYCLE ==========
  /// ----------------------------

  @override
  void onClose() {
    newPasswordController.dispose(); // Hapus controller saat tidak digunakan
    confirmPasswordController.dispose();
    super.onClose();
  }
}
