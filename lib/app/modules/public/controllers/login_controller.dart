import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, String>> users = [
  {'email': 'test', 'password': '123'},
  {'email': 'admin', 'password': 'admin1'},
];

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey; // Expose the form key

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      bool authenticated = users.any(
          (user) => user['email'] == email && user['password'] == password);

      if (authenticated) {
        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offNamed('/public/home');
      } else {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}