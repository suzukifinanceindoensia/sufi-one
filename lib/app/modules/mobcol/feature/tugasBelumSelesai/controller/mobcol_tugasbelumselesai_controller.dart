import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBelumSelesai_model.dart'; 
import 'package:sufi_one/app/modules/mobcol/services/tugasBelumSelesai_service.dart'; 

class MobcolTugasbelumselesaiController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;
  final TugasBelumSelesaiService _tugasBelumSelesaiService = Get.find<TugasBelumSelesaiService>();
  final RxList<TugasBelumSelesaiModel> allTugasBelumSelesai = <TugasBelumSelesaiModel>[].obs;
  final RxList<TugasBelumSelesaiModel> filteredTugasBelumSelesai = <TugasBelumSelesaiModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December",
  };

  @override
  void onInit() {
    super.onInit();
    fetchTugasBelumSelesai();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchTugasBelumSelesai() async {
    isLoading.value = true;
    try {
      final List<TugasBelumSelesaiModel> data = await _tugasBelumSelesaiService.getAllTugasBelumSelesaiFromJson();
      allTugasBelumSelesai.assignAll(data);
      filteredTugasBelumSelesai.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data: $e';
      isLoading.value = false;
    }
  }

  void _onSearchChanged() {
    searchText.value = searchController.text;
    if (searchText.isEmpty) {
      filteredTugasBelumSelesai.value = allTugasBelumSelesai;
    } else {
      filteredTugasBelumSelesai.value = allTugasBelumSelesai
          .where((tugas) => tugas.name?.toLowerCase().contains(searchText.toLowerCase()) ?? false)
          .toList();
    }
  }
}