import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/models/user_profile_model.dart';

class ProfilePageController extends GetxController {
  final user = Rx<UserProfile?>(null);
  RxString gender = ''.obs;
  RxString job = ''.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordChange = false.obs;

  final profileFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final ktpController = TextEditingController();
  final kontrak1Controller = TextEditingController();
  final kontrak2Controller = TextEditingController();
  final kontrak3Controller = TextEditingController();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadUserFromJsonAsset();
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

  void loadUserFromJsonAsset() async {
    final profile = await loadUserProfileFromJsonAsset(); // method di model
    user.value = profile;

    nameController.text = profile.name;
    phoneController.text = profile.phone;
    emailController.text = profile.email;
    addressController.text = profile.address;

    birthDateController.clear();
    gender.value = '';
    job.value = '';
    ktpController.clear();
    kontrak1Controller.clear();
    kontrak2Controller.clear();
    kontrak3Controller.clear();
  }

  // ---------------------- UI Actions -----------------------
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void togglePasswordChange() {
    isPasswordChange.toggle();
  }

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

  String? validateOptionalContract(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor kontrak harus berupa angka';
    }
    return null;
  }

  void saveProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      if (isPasswordChange.value) {
        changePassword();
      }
      updateProfileInfo();
    }
  }

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
  }
}
