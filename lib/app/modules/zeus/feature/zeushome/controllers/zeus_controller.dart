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
  RxString selectedPlatNomor = 'Loading'.obs;
  final RxString _foundPlatResult = 'Tidak Ditemukan'.obs;
  String get foundPlatResult => _foundPlatResult.value;

  final ImagePicker _picker = ImagePicker();

  @override
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
      if (listPlatNomor.isNotEmpty) {
        selectedPlatNomor.value = listPlatNomor.first.platNomor;
      }
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
        _photoTaken.value = true;
        _foundPlatResult.value = 'Detect Lewat gambar'; // ini seharusnya diisi dengan hasil detect plat lwt gambar
      } else {
        _photoTaken.value = false;
      }
    } catch (e) {
      print('Error taking photo: $e');
      _photoTaken.value = false;
      Get.snackbar(
        'Error',
        'Gagal mengambil foto: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void compareAndSetPlat({required String inputPlat}) {
    // Cari plat nomor di listPlatNomor (case-insensitive)
    final foundModel = listPlatNomor.firstWhereOrNull(
      (element) => element.platNomor.toLowerCase() == inputPlat.toLowerCase(),
    );

    if (foundModel != null) {
      _foundPlatResult.value = foundModel.platNomor;
      Get.snackbar(
        'Sukses',
        'Plat nomor "${foundModel.platNomor}" ditemukan!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      _foundPlatResult.value = 'Tidak Ditemukan';
      Get.snackbar(
        'Peringatan',
        'Plat nomor "$inputPlat" tidak ditemukan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
    }
    // Set photoTaken ke true agar informasi plat muncul (jika diperlukan)
    _photoTaken.value = true;
  }

  void resetPhotoStatus() {
    _photoTaken.value = false;
    _imageFile.value = null;
    _foundPlatResult.value = 'Tidak Ditemukan'; // Reset hasil plat juga
  }

  @override
  void onClose() {
    super.onClose();
  }
}