import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      // Implementasikan aksi pengiriman data
      Get.snackbar(
        "Sukses",
        "Form berhasil dikirim",
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    }
  }

  void clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
