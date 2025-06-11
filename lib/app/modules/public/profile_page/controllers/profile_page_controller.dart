import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/models/user_model.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class ProfilePageController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  Rx<UserModel?> user = Rx<UserModel?>(null);

  // Reactive variable untuk data gender dan pekerjaan (job)
  RxString gender = ''.obs;
  RxString job = ''.obs;

  // visibilitas password dan status perubahan password
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordChange = false.obs;

  // Key form untuk validasi input profile
  final profileFormKey = GlobalKey<FormState>();

  // Controller textfield untuk profil user
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final ktpController = TextEditingController();
  final kontrak1Controller = TextEditingController();
  final kontrak2Controller = TextEditingController();
  final kontrak3Controller = TextEditingController();

  // Controller textfield untuk password
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Load data user dari AuthController saat inisialisasi controller
    loadUserFromAuth();
  }

  @override
  void onClose() {
    // Dispose semua controller textfield agar tidak memory leak
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    ktpController.dispose();
    kontrak1Controller.dispose();
    kontrak2Controller.dispose();
    kontrak3Controller.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Mengisi data user ke controller berdasarkan user yang aktif dari AuthController
  void loadUserFromAuth() {
    final currentUser = _authController.user.value;
    if (currentUser != null) {
      user.value = currentUser;

      // Set nilai awal textfield dari data user
      nameController.text = currentUser.name;
      phoneController.text = currentUser.phone;
      emailController.text = currentUser.email;
      addressController.text = currentUser.address;

      // Kosongkan data opsional yang tidak tersedia saat ini
      birthDateController.clear();
      gender.value = '';
      job.value = '';
      ktpController.clear();
      kontrak1Controller.clear();
      kontrak2Controller.clear();
      kontrak3Controller.clear();
    }
  }

  // Fungsi toggle untuk visibilitas password (show/hide)
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  // Fungsi toggle untuk mengaktifkan atau menonaktifkan perubahan password
  void togglePasswordChange() {
    isPasswordChange.toggle();
  }

  // Validator input form untuk masing-masing field
  String? validateName(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter your name' : null;

  String? validatePhone(String? value) =>
      (value == null || value.isEmpty)
          ? 'Please enter your phone number'
          : null;

  String? validateEmail(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter your email' : null;

  String? validateAddress(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter your address' : null;

  String? validateCurrentPassword(String? value) =>
      (value == null || value.isEmpty)
          ? 'Please enter your current password'
          : null;

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your new password';
    if (value == currentPasswordController.text) {
      return 'New password must be different from current password';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty)
      return 'Please confirm your new password';
    if (value != newPasswordController.text) return 'Passwords do not match';
    return null;
  }

  // Validator untuk nomor kontrak opsional, hanya valid jika angka saja
  String? validateOptionalContract(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor kontrak harus berupa angka';
    }
    return null;
  }

  // Fungsi simpan profil dan jika password berubah, juga ganti password
  void saveProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      if (isPasswordChange.value) {
        changePassword();
      }
      updateProfileInfo();
    }
  }

  // Update data profil user pada model dan tampilkan snackbar sukses
  void updateProfileInfo() {
    if (user.value != null) {
      user.value = user.value!.copyWith(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        address: addressController.text,
      );
    }

    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.TOP,
    );
  }

  // date picker memilih tanggal lahir
  void pickBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.iconDefault,
              onPrimary: AppColors.bg1,
              surface: AppColors.bg1,
              onSurface: AppColors.iconDefault,
            ),
            dialogTheme: DialogTheme(backgroundColor: AppColors.bg1),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      birthDateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  // Fungsi untuk mengganti password dengan validasi yang sederhana
  void changePassword() {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      Get.snackbar(
        'Error',
        'New password and confirmation do not match',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (currentPassword == newPassword) {
      Get.snackbar(
        'Error',
        'New password must be different from current password',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Password updated successfully',
      snackPosition: SnackPosition.TOP,
    );
  }
}
