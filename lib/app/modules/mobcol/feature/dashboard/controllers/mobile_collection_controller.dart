import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBaru_model.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart'; 

class MobcolDashboardController extends GetxController {
  final AllTugasBaruService _allTugasBaruService = AllTugasBaruService();
  RxList<AllTugasBaruModel> listTugasBaru = <AllTugasBaruModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataTugasBaru();
  }

  Future<void> fetchDataTugasBaru() async {
    isLoading.value = true;
    try {
      final List<AllTugasBaruModel> data = await _allTugasBaruService.getAllTugasBaruFromJson();
      listTugasBaru.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data: $e';
      isLoading.value = false;
    }
  }
}