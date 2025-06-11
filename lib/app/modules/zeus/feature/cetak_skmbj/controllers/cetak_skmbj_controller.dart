import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_skmbj/models/skmbj_model.dart';
import 'package:sufi_one/app/modules/zeus/services/zeus_utils_service.dart';

class CetakSkmbjController extends GetxController {
  var selectedCabang = ''.obs;
  var listCabang = <String>[].obs;
  var nomorKontrak = ''.obs;
  var nomorPolisi = ''.obs;

  var dataSkmbj = <SkmbjModel>[].obs;

  var isLoading = false.obs; // state loading

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
      // delay loading 2 detik
      await Future.delayed(const Duration(seconds: 2));

      dataSkmbj.value = await ZeusUtilsService.loadJsonData<SkmbjModel>(
        path: 'res/dummyData/zeus/skmbj.json',
        fromJson: (json) => SkmbjModel.fromJson(json),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
