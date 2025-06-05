import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class TaskAssignController extends GetxController {
  final ZeushomeService _zeushomeService = Get.find<ZeushomeService>();

  // Observable list to hold the currently displayed (potentially filtered) tasks
  final RxList<ZeushomeModel> allTasks = <ZeushomeModel>[].obs;
  // Private RxList to store the original unfiltered data
  final RxList<ZeushomeModel> _originalAllTasks = <ZeushomeModel>[].obs; // Changed to RxList

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  // Observable for the search query input
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
    // Listen for changes in searchQuery and call filterTasks
    debounce(searchQuery, (String query) {
      filterTasks(query);
    }, time: const Duration(milliseconds: 300)); // Debounce to prevent too many calls
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
        // Check if platNomor or tipeMobil contains the query
        return task.platNomor.toLowerCase().contains(lowerCaseQuery) ||
               task.tipeMobil.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      allTasks.assignAll(filteredList); // Update the observable list with filtered results
    }
  }
}
