import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class ZeusController extends GetxController {
  final Rx<XFile?> _imageFile = Rx<XFile?>(null);
  XFile? get imageFile => _imageFile.value;
  final RxBool _photoTaken = false.obs;
  bool get photoTaken => _photoTaken.value;

  final ZeushomeService _allZeushomeService = ZeushomeService();
  RxList<ZeushomeModel> listPlatNomor = <ZeushomeModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  final ImagePicker _picker = ImagePicker();
  void onInit() {
    super.onInit();
    fetchDataPlatNomor();
  }
  Future<void> fetchDataPlatNomor() async {
    isLoading.value = true;
    try {
      final List<ZeushomeModel> dataBaru = await _allZeushomeService.getAllTugasBaruFromJson();
      listPlatNomor.assignAll(dataBaru);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data: $e';
      print(errorMessage);
      isLoading.value = false;
    }
  }
  Future<void> takePhoto() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _imageFile.value = pickedFile;
        _photoTaken.value = true; // Set to true when a photo is successfully taken
      } else {
        _photoTaken.value = false; // Reset if no photo was picked (e.g., user cancelled)
      }
    } catch (e) {
      print('Error taking photo: $e');
      _photoTaken.value = false; // Reset on error
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

  void resetPhotoStatus() {
    _photoTaken.value = false;
    _imageFile.value = null; 
  }

  @override
  void onClose() {
    super.onClose();
  }
}