import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:sufi_one/app/routes/app_routes.dart';

class ProcessSurveyController extends GetxController {
  // Form Controllers for Text Fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  // Selected options for multiple choice
  Rx<String?> selectedOption1 = Rx<String?>(null);
  Rx<String?> selectedOption2 = Rx<String?>(null);
  Rx<String?> selectedOption3 = Rx<String?>(null);

  // List of options for multiple choice
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  // Selected image file
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  // Function to pick image
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera); // Or use .gallery

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      print('No image selected.'); // Important for debugging
    }
  }

  // Function to handle form submission
  void submitForm() {
    Get.toNamed(AppRoutes.mobileSurvey);
    if (Get.find<GlobalKey<FormState>>().currentState!.validate()) {
      print('Name: ${nameController.text}');
      print('Address: ${addressController.text}');
      print('Notes: ${notesController.text}');
      print('Option 1: ${selectedOption1.value}');
      print('Option 2: ${selectedOption2.value}');
      print('Option 3: ${selectedOption3.value}');
      print('Image Path: ${selectedImage.value?.path}');

      Get.snackbar(
        'Success',
        'Form submitted successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is closed
    nameController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.onClose();
  }
}