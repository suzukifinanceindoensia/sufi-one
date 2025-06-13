import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';
import 'package:flutter/material.dart';

class TaskAssignController extends GetxController {
  final ZeushomeService _zeushomeService = Get.find<ZeushomeService>();

  final RxList<ZeushomeModel> allTasks = <ZeushomeModel>[].obs;
  final RxList<ZeushomeModel> _originalAllTasks = <ZeushomeModel>[].obs;

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
    debounce(searchQuery, (String query) {
      filterTasks(query);
    }, time: const Duration(milliseconds: 300));
  }

  Future<void> fetchTasks() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final List<ZeushomeModel> data = await _zeushomeService.getAllTugasBaruFromJson();
      _originalAllTasks.assignAll(data);
      allTasks.assignAll(data);
    } catch (e) {
      errorMessage.value = 'Failed to load tasks: $e';
      print('Error fetching tasks: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void filterTasks(String query) {
    if (query.isEmpty) {
      allTasks.assignAll(_originalAllTasks);
    } else {
      final filteredList = _originalAllTasks.where((task) {
        final lowerCaseQuery = query.toLowerCase();
        return task.platNomor.toLowerCase().contains(lowerCaseQuery) ||
               task.tipeMobil.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      allTasks.assignAll(filteredList);
    }
  }

  Future<void> requestSkmbjForTask(String platNomor) async {
    print('Initiating SKMBJ request for Plat Nomor: $platNomor');

    try {
      await Future.delayed(const Duration(seconds: 1)); 

      Get.snackbar(
        'SKMBJ Request Sent',
        'Request for Plat Nomor "$platNomor" has been submitted successfully.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } catch (e) {
      print('Error during SKMBJ request for $platNomor: $e');
      Get.snackbar(
        'SKMBJ Request Failed',
        'Could not submit request for "$platNomor". Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    }
  }
}