import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class CeknopolController extends GetxController {
  final Rx<XFile?> _imageFile = Rx<XFile?>(null);
  XFile? get imageFile => _imageFile.value;
  final RxBool _photoTaken = false.obs;
  bool get photoTaken => _photoTaken.value;

  final ZeushomeService _allZeushomeService = ZeushomeService();
  RxList<ZeushomeModel> listPlatNomor = <ZeushomeModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  RxString SelectedPlatNomor = 'Loading'.obs;
  RxString SelectedTipeMobil = 'Loading'.obs;
  RxString SelectedStatus = 'Loading'.obs;
  RxString SelectedNo_SKMBJ = 'Loading'.obs;
  final RxList<ZeushomeModel> selectedPlatNomorList = <ZeushomeModel>[].obs;

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
        SelectedPlatNomor.value = 'Detect Lewat gambar';
        SelectedTipeMobil.value = 'Detect Lewat gambar';
        SelectedNo_SKMBJ.value = 'Detect Lewat gambar';
        SelectedStatus.value = 'Detect Lewat gambar';
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
    final foundModel = listPlatNomor.firstWhereOrNull(
      (element) => element.platNomor.toLowerCase() == inputPlat.toLowerCase(),
    );

    if (foundModel != null) {
      SelectedPlatNomor.value = foundModel.platNomor;
      SelectedTipeMobil.value = foundModel.tipeMobil;
      SelectedNo_SKMBJ.value = foundModel.noSkmbj;
      SelectedStatus.value = foundModel.status;
      selectedPlatNomorList.assignAll([foundModel]);
      _photoTaken.value = true;
      _imageFile.value = null;
      Get.snackbar(
        'Sukses',
        'Plat nomor "${foundModel.platNomor}" ditemukan!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      SelectedPlatNomor.value = 'tidak ditemukan';
      SelectedTipeMobil.value = 'tidak ditemukan';
      SelectedNo_SKMBJ.value = 'tidak ditemukan';
      SelectedStatus.value = 'tidak ditemukan';
      _photoTaken.value = false;
      _imageFile.value = null;
      Get.snackbar(
        'Peringatan',
        'Plat nomor "$inputPlat" tidak ditemukan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
    }
  }

  void resetPhotoStatus() {
    _photoTaken.value = false;
    _imageFile.value = null;
    SelectedPlatNomor.value = 'tidak ditemukan';
    SelectedTipeMobil.value = 'tidak ditemukan';
    SelectedNo_SKMBJ.value = 'tidak ditemukan';
    SelectedStatus.value = 'tidak ditemukan';
  }

  @override
  void onClose() {
    super.onClose();
  }
}