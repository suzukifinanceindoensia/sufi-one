import 'package:get/get.dart';

class DetailZeusController extends GetxController {
    RxString SelectedPlatNomor = 'Loading'.obs;
    RxString SelectedTipeMobil = 'Loading'.obs;
    RxString SelectedStatus = 'Loading'.obs;
    RxString SelectedNo_SKMBJ = 'Loading'.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments.isNotEmpty) {
      print("ini isinya ${Get.arguments}");
      SelectedPlatNomor.value = Get.arguments[0].platNomor;
      SelectedTipeMobil.value = Get.arguments[0].tipeMobil;
      SelectedStatus.value = Get.arguments[0].status;
      SelectedNo_SKMBJ.value = Get.arguments[0].noSkmbj;
    }
    else{
      SelectedPlatNomor.value = 'Tidak Ditemukan';
      SelectedTipeMobil.value = 'Tidak Ditemukan';
      SelectedStatus.value = 'Tidak Ditemukan';
      SelectedNo_SKMBJ.value = 'Tidak Ditemukan';
    }
  }

  void kembaliKeHalamanSebelumnya() {
    Get.back(result: {
      'pesanBalik': 'Data dari halaman detail sudah diterima!',
      'statusPlat': 'Valid'
    });
  }
}