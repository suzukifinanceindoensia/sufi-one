import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBaru_model.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBelumSelesai_model.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasSelesai_model.dart';
import 'package:sufi_one/app/modules/mobcol/models/uploadBukti_model.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBelumSelesai_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasSelesai_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/uploadBukti_service.dart'; 

class MobcolDashboardController extends GetxController {
  final AllTugasBaruService _allTugasBaruService = AllTugasBaruService();
  final TugasSelesaiService _tugasSelesaiService = Get.find<TugasSelesaiService>();
  final TugasBelumSelesaiService _tugasBelumSelesaiService = Get.find<TugasBelumSelesaiService>();
  final UploadBuktiService _uploadBuktiService = Get.find<UploadBuktiService>();

  RxList<AllTugasBaruModel> listTugasBaru = <AllTugasBaruModel>[].obs;
  RxList<TugasBelumSelesaiModel> listTugasBelumSelesai = <TugasBelumSelesaiModel>[].obs;
  RxList<AllTugasSelesaiModel> listTugasSelesai = <AllTugasSelesaiModel>[].obs;
  RxList<AllUploadBuktiModel> listUploadBukti = <AllUploadBuktiModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  RxBool isLoadingBelumSelesai = false.obs;
  RxString errorMessageBelumSelesai = ''.obs;
  RxBool isLoadingSelesai = false.obs;
  RxString errorMessageSelesai = ''.obs;
  RxBool isLoadingUpload = false.obs;
  RxString errorMessageUpload = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchDataTugasBaru();
    fetchDataTugasBelumSelesai();
    fetchTugasSelesai();
    fetchUploadBukti();
  }

  Future<void> fetchDataTugasBaru() async {
    isLoading.value = true;
    try {
      final List<AllTugasBaruModel> dataBaru = await _allTugasBaruService.getAllTugasBaruFromJson();
      listTugasBaru.assignAll(dataBaru);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data: $e';
      print(errorMessage);
      isLoading.value = false;
    }
  }
    Future<void> fetchDataTugasBelumSelesai() async {
    isLoadingBelumSelesai.value = true;
    try {
      final List<TugasBelumSelesaiModel> databelumselesai = await _tugasBelumSelesaiService.getAllTugasBelumSelesaiFromJson();
      listTugasBelumSelesai.assignAll(databelumselesai);
      isLoadingBelumSelesai.value = false;
    } catch (e) {
      errorMessageBelumSelesai.value = 'Gagal mengambil data tugas belum selesai: $e';
      print(errorMessageBelumSelesai);
      isLoadingBelumSelesai.value = false;
    }
  }
  Future<void> fetchTugasSelesai() async {
    isLoadingUpload.value = true;
    try {
      final List<AllTugasSelesaiModel> dataSelesai = await _tugasSelesaiService.getAllTugasSelesaiFromJson();
      listTugasSelesai.assignAll(dataSelesai);
      isLoadingSelesai.value = false;
    } catch (e) {
      errorMessageSelesai.value = 'Gagal mengambil data: $e';
      print(errorMessageSelesai);
      isLoadingSelesai.value = false;
    }
  }
  Future<void> fetchUploadBukti() async {
    isLoadingUpload.value = true;
    try {
      final List<AllUploadBuktiModel> dataUpload = await _uploadBuktiService.getAllUploadBuktiFromJson();
      listUploadBukti.assignAll(dataUpload);
      isLoading.value = false;
    } catch (e) {
      errorMessageUpload.value = 'Gagal mengambil data: $e';
      print(errorMessageUpload);
      isLoadingSelesai.value = false;
    }
  }
}