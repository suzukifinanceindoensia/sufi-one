import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_stmbj/models/cetak_stmbj_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeus_utils_service.dart';

class CetakStmbjController extends GetxController {
  var selectedCabang = ''.obs;
  var nomorKontrak = ''.obs;
  var nomorPolisi = ''.obs;
  var isLoading = false.obs;
  var listCabang = <String>[].obs;

  var dataStmbj = <StmbjModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    ZeusUtilsService.loadDaftarCabang().then(
      (value) => listCabang.value = value,
    );
  }

  Future<void> searchData() async {
    try {
      isLoading.value = true;

      // Simulasi loading 2 detik
      await Future.delayed(const Duration(seconds: 2));

      dataStmbj.clear();

      if (dataStmbj.isEmpty) {
        ZeusUtilsService.showEmptyDataSnackbar();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
