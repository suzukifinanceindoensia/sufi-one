import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile {
  String name;
  String phone;
  String email;
  String address;
  String username;
  String role;
  String cabang;

  UserProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.username,
    required this.role,
    required this.cabang,
  });
}

class ProfilePageController extends GetxController {
  final user =
      UserProfile(
        name: 'Asep Junaedi',
        phone: '08121213456',
        email: 'asep@suzuki.co.id',
        address: 'Pulo Gadung',
        username: 'Admin',
        role: 'Marketing',
        cabang: 'Head Office',
      ).obs;

  final profileFormKey = GlobalKey<FormState>();

  // Basic info
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  // Tambahan untuk data profil
  final birthDateController = TextEditingController();
  RxString gender = ''.obs;
  RxString job = ''.obs;

  final ktpController = TextEditingController();
  final kontrak1Controller = TextEditingController();
  final kontrak2Controller = TextEditingController();
  final kontrak3Controller = TextEditingController();

  // Password
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordChange = false.obs;

  // -------------------------------
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void togglePasswordChange() {
    isPasswordChange.value = !isPasswordChange.value;
  }

  // -------------------------------
  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your name';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your phone number';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your address';
    return null;
  }

  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter your current password';
    return null;
  }

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

  String? validateOptionalContract(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor kontrak harus berupa angka';
    }
    return null;
  }

  // -------------------------------
  void updateProfileInfo() {
    user.update((u) {
      if (u != null) {
        u.name = nameController.text;
        u.phone = phoneController.text;
        u.email = emailController.text;
        u.address = addressController.text;
      }
    });

    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );

    print(
      'Updated profile: ${user.value.name}, ${user.value.phone}, ${user.value.email}, ${user.value.address}',
    );
  }

  void changePassword() {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      Get.snackbar(
        'Error',
        'New password and confirmation do not match',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (currentPassword == newPassword) {
      Get.snackbar(
        'Error',
        'New password must be different from current password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Password updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    print('Password updated');
  }

  void saveProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      if (isPasswordChange.value) {
        changePassword();
      }
      updateProfileInfo();
    }
  }

  @override
  void onInit() {
    nameController.text = user.value.name;
    phoneController.text = user.value.phone;
    emailController.text = user.value.email;
    addressController.text = user.value.address;

    // Set default kosong atau dummy data (jika perlu)
    birthDateController.text = '';
    gender.value = '';
    job.value = '';
    ktpController.text = '';
    kontrak1Controller.text = '';
    kontrak2Controller.text = '';
    kontrak3Controller.text = '';

    super.onInit();
  }

  @override
  void onClose() {
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
}
