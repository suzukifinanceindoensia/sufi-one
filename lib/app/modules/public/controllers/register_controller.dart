import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final telpNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isChecked = false.obs;

  GlobalKey<FormState> get formKey => _formKey;

  void toggleChecked(value) {
    if (value != null) {
      isChecked.value = value;
    }
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Lengkap harus diisi';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username harus diisi';
    }
    if (value.length < 4) {
      return 'Username minimal 4 karakter';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email harus diisi';
    }
    final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validateTelpNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor Telepon harus diisi';
    }
    final phoneRegex = RegExp(r'^[+0-9]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Nomor Telepon tidak valid';
    }
    if (value.length < 10) {
      return 'Nomor Telepon minimal 10 angka';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi Password harus diisi';
    }
    if (value != passwordController.text) {
      return 'Password berbeda';
    }
    return null;
  }

  void register() {
    if (_formKey.currentState!.validate()) { //check the checkbox
      //entar masukin disini bagian databse
      String fullName = fullNameController.text;
      String username = usernameController.text;
      String email = emailController.text;
      String telpNumber = telpNumberController.text;
      String password = passwordController.text;

      print('Full Name: $fullName');
      print('Username: $username');
      print('Email: $email');
      print('Telp Number: $telpNumber');
      print('Password: $password');

      Get.toNamed('/public/login');
      Get.snackbar(
        'Success',
        'Registrasi Berhasil!',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } else{
      Get.snackbar(
        'Error',
        'Registrasi Tidak berhasil',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearForm() {
    fullNameController.clear();
    usernameController.clear();
    emailController.clear();
    telpNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    telpNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
