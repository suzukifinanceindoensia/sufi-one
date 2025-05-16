import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBaru_model.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';

class MobcolTugasbaruController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;

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
  final RxList<AllTugasBaruModel> alltugasbaru = <AllTugasBaruModel>[].obs;
  final RxList<AllTugasBaruModel> filteredtugasbaru = <AllTugasBaruModel>[].obs;
  late final AllTugasBaruService _tugasBaruService;

  @override
  void onInit() {
    super.onInit();
    _tugasBaruService = Get.find<AllTugasBaruService>();
    _loadAllTugasBaru();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> _loadAllTugasBaru() async {
    final data = await _tugasBaruService.getAllTugasBaruFromJson();
    alltugasbaru.value = data;
    filteredtugasbaru.value = data;
  }

  void _onSearchChanged() {
    searchText.value = searchController.text;
    if (searchText.isEmpty) {
      filteredtugasbaru.value = alltugasbaru;
    } else {
      filteredtugasbaru.value = alltugasbaru
          .where((tugas) => tugas.name
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}