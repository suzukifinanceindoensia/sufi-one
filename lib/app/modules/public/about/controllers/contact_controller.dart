import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/about/models/contact_form_model.dart';

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      final formData = ContactFormModel(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        message: messageController.text.trim(),
      );

      // Simulasi kirim data
      print("Data yang dikirim: ${formData.toMap()}");

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
