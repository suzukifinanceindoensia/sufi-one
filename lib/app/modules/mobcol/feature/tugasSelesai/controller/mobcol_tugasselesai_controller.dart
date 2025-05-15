import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasSelesai_model.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasSelesai_service.dart';

class MobcolTugasSelesaiController extends GetxController {
  final TugasSelesaiService _allTugasSelesaiService = Get.find<TugasSelesaiService>();
  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;
  final RxList<AllTugasSelesaiModel> alltugasselesai = <AllTugasSelesaiModel>[].obs;
  final RxList<AllTugasSelesaiModel> filteredtugasselesai = <AllTugasSelesaiModel>[].obs;
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
    _loadAllTugasSelesai();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> _loadAllTugasSelesai() async {
    final data = await _allTugasSelesaiService.getAllTugasSelesaiFromJson();
    alltugasselesai.value = data;
    filteredtugasselesai.value = data;
  }

  void _onSearchChanged() {
    searchText.value = searchController.text;
    if (searchText.isEmpty) {
      filteredtugasselesai.value = alltugasselesai;
    } else {
      filteredtugasselesai.value = alltugasselesai
          .where((tugas) => tugas.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}