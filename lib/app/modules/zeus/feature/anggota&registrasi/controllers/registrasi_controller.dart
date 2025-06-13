import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:image_picker/image_picker.dart';

class RegistrasiController extends GetxController {
  var isLoading = false.obs;
  var imageFile = Rxn<File>();

  Future<void> fetchAgents() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    print('Fetching agents...');
    isLoading.value = false;
  }

  void goToRegisterPage() {
    Get.toNamed(ZeusRoute.register);
  }

  Future<void> pickImageFromCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      } else {
        print("Pengambilan gambar dibatalkan.");
      }
    } catch (e) {
      print("Error saat membuka kamera: $e");
    }
  }

  void submitPhoto() {
    if (imageFile.value != null) {
      print("Foto berhasil disubmit: ${imageFile.value!.path}");

      // Tunda reset image agar UI punya waktu untuk transisi
      Future.delayed(const Duration(milliseconds: 300), () {
        imageFile.value = null;
      });
    } else {
      print("Tidak ada foto yang dipilih.");
    }
  }

  void cancelPhoto() {
    imageFile.value = null;
  }
}
