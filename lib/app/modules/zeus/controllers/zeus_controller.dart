import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ZeusController extends GetxController {
  final Rx<XFile?> _imageFile = Rx<XFile?>(null);
  XFile? get imageFile => _imageFile.value; 

  final ImagePicker _picker = ImagePicker();

  Future<void> takePhoto() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _imageFile.value = pickedFile;
      }
    } catch (e) {
      print('Error taking photo: $e');
      Get.snackbar(
        'Error',
        'Gagal mengambil foto: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void printManualFormData({
    required String plat,
  }) {
    print('--- Data Form Manual ---');
    print('PLAT NOMOR: $plat');
    print('------------------------');

    Get.snackbar(
      'Sukses',
      'Data form berhasil disimpan dan dicetak ke terminal!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
