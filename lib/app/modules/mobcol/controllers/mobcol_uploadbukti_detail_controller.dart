import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MobcolUploadbuktiDetailController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> getImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
  }
}