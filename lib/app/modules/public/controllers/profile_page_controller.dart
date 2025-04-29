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
  // User data in an observable (Rx)
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

  // Controllers for text fields
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  // Password controllers
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // RxBool to toggle password visibility
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordChange = false.obs;

  // -------------------------------
  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // -------------------------------
  // Toggle password change mode (used for saving password change)
  void togglePasswordChange() {
    isPasswordChange.value = !isPasswordChange.value;
  }

  // -------------------------------
  // Input validation methods
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

  // -------------------------------
  // Update profile info method
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

  // Change password logic
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

  // Method to save profile data
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
    // Set default values to controllers from user data
    nameController.text = user.value.name;
    phoneController.text = user.value.phone;
    emailController.text = user.value.email;
    addressController.text = user.value.address;
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is closed
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
