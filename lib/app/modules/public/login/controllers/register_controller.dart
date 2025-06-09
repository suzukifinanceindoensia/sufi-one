import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/login/models/register_model.dart';
import 'package:sufi_one/app/auth/controllers/auth_controller.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class RegisterController extends GetxController {
  /// ----------------------------
  /// ========== FORM & STATE ==========
  /// ----------------------------

  final GlobalKey<FormState> _registKey = GlobalKey<FormState>();
  GlobalKey<FormState> get registKey => _registKey;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final telpNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =
      TextEditingController(); // Konfirmasi password
  final birthDateController = TextEditingController();

  final isChecked = false.obs;
  final selectedGender = ''.obs;
  final selectedJob = ''.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  final box = GetStorage(); // Penyimpanan lokal (opsional)

  /// ----------------------------
  /// ========== MODEL ==========
  /// ----------------------------

  RegisterModel get registerData {
    // Data register yang akan dikirim
    return RegisterModel(
      fullName: fullNameController.text,
      email: emailController.text,
      telpNumber: telpNumberController.text,
      password: passwordController.text,
    );
  }

  /// ----------------------------
  /// ========== ACTION ==========
  /// ----------------------------

  void pickBirthDate(BuildContext context) async {
    // Memunculkan date picker untuk input tanggal lahir
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.iconDefault, // Warna utama
              onPrimary: AppColors.bg1, // Warna teks tombol
              surface: AppColors.bg1, // Warna latar date picker
              onSurface: AppColors.iconDefault, // Warna teks tanggal
            ),
            dialogTheme: DialogTheme(
              backgroundColor: AppColors.bg1,
            ), // Latar dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      birthDateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  void toggleChecked(bool? value) {
    // Ubah status checkbox
    if (value != null) {
      isChecked.value = value;
    }
  }

  void register() async {
    // Proses registrasi
    if (_registKey.currentState!.validate()) {
      if (!isChecked.value) {
        Get.snackbar('Error', 'Harap setujui terms and conditions');
        return;
      }

      try {
        final name = fullNameController.text;
        final email = emailController.text;
        final password = passwordController.text;

        await Get.find<AuthController>().register(name, email, password);

        if (Get.find<AuthController>().isLoggedIn) {
          clearForm(); // Bersihkan form jika berhasil
          Get.offAllNamed(HomeRoutes.profilePage); // Arahkan ke halaman profile
        }
      } catch (e) {
        // Tampilkan error jika gagal
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar('Error', 'Registrasi tidak berhasil');
    }
  }

  /// ----------------------------
  /// ========== VALIDATOR ==========
  /// ----------------------------

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) return 'Nama lengkap wajib diisi';
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username wajib diisi';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email wajib diisi';
    if (!value.contains('@')) return 'Email tidak valid';
    return null;
  }

  String? validateTelpNumber(String? value) {
    if (value == null || value.isEmpty) return 'Nomor telepon wajib diisi';
    if (value.length < 8) return 'Nomor telepon terlalu pendek';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password wajib diisi';
    if (value.length < 6) return 'Password minimal 6 karakter';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) return 'Password tidak cocok';
    return null;
  }

  /// ----------------------------
  /// ========== UTIL ==========
  /// ----------------------------

  void clearForm() {
    // Reset semua input dan checkbox
    fullNameController.clear();
    emailController.clear();
    telpNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isChecked.value = false;
  }

  /// ----------------------------
  /// ========== LIFECYCLE ==========
  /// ----------------------------

  @override
  void onClose() {
    // Dispose semua controller input saat tidak digunakan
    fullNameController.dispose();
    emailController.dispose();
    telpNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    birthDateController.dispose();
    super.onClose();
  }
}
