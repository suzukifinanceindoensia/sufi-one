
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/uploadBukti_model.dart';
import 'package:sufi_one/app/modules/mobcol/services/uploadBukti_service.dart';

class MobcolUploadBuktiController extends GetxController {
  final UploadBuktiService _allUploadBuktiService = Get.find<UploadBuktiService>();

  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;
  final RxList<AllUploadBuktiModel> alluploadbukti = <AllUploadBuktiModel>[].obs;
  final RxList<AllUploadBuktiModel> filtereduploadbukti = <AllUploadBuktiModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final Map<int, String> monthsInYear = {
    1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June",
    7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December",
  };

  @override
  void onInit() {
    super.onInit();
    _loadAllUploadBukti();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> _loadAllUploadBukti() async {
    try {
      isLoading.value = true;
      final data = await _allUploadBuktiService.getAllUploadBuktiFromJson();
      alluploadbukti.value = data;
      filtereduploadbukti.value = data;
      errorMessage.value = ''; // Clear any previous error
    } catch (e) {
      errorMessage.value = 'Failed to load data: $e';
      print('Error loading upload bukti: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _onSearchChanged() {
    searchText.value = searchController.text;
    if (searchText.isEmpty) {
      filtereduploadbukti.value = alluploadbukti;
    } else {
      filtereduploadbukti.value = alluploadbukti
          .where((bukti) => bukti.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}