import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/models/register_model.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> _registKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final telpNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isChecked = false.obs;

  GlobalKey<FormState> get registKey => _registKey;

  RegisterModel get registerData {
    return RegisterModel(
      fullName: fullNameController.text,
      username: usernameController.text,
      email: emailController.text,
      telpNumber: telpNumberController.text,
      password: passwordController.text,
    );
  }

  void toggleChecked(bool? value) {
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
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
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
    if (_registKey.currentState!.validate()) {
      if (!isChecked.value) {
        Get.snackbar(
          'Error',
          'Harap setujui terms and conditions',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final data = registerData;

      print('Full Name: ${data.fullName}');
      print('Username: ${data.username}');
      print('Email: ${data.email}');
      print('Telp Number: ${data.telpNumber}');
      print('Password: ${data.password}');

      // TODO: panggil API / simpan data ke database disini

      Get.toNamed('/public/login');
      Get.snackbar(
        'Success',
        'Registrasi Berhasil!',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } else {
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
    isChecked.value = false;
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
