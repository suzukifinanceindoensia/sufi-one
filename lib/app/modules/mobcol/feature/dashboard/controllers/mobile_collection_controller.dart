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
  late final AllTugasBaruService _allTugasBaruService;
  late final TugasSelesaiService _tugasSelesaiService;
  late final TugasBelumSelesaiService _tugasBelumSelesaiService;
  late final UploadBuktiService _uploadBuktiService;

  MobcolDashboardController({
    required AllTugasBaruService allTugasBaruService,
    required TugasSelesaiService tugasSelesaiService,
    required TugasBelumSelesaiService tugasBelumSelesaiService,
    required UploadBuktiService uploadBuktiService,
  })  : _allTugasBaruService = allTugasBaruService,
        _tugasSelesaiService = tugasSelesaiService,
        _tugasBelumSelesaiService = tugasBelumSelesaiService,
        _uploadBuktiService = uploadBuktiService;

  RxList<AllTugasBaruModel> listTugasBaru = <AllTugasBaruModel>[].obs;
  RxList<TugasBelumSelesaiModel> listTugasBelumSelesai = <TugasBelumSelesaiModel>[].obs;
  RxList<AllTugasSelesaiModel> listTugasSelesai = <AllTugasSelesaiModel>[].obs;
  RxList<AllUploadBuktiModel> listUploadBukti = <AllUploadBuktiModel>[].obs;

  RxInt countTugasBaru = 0.obs;
  RxInt countTugasBelumSelesai = 0.obs;
  RxInt countTugasSelesai = 0.obs;
  RxInt countUploadBukti = 0.obs;
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
    _fetchInitialData();
    ever(listTugasBaru, (_) => countTugasBaru.value = listTugasBaru.length);
    ever(listTugasBelumSelesai, (_) => countTugasBelumSelesai.value = listTugasBelumSelesai.length);
    ever(listTugasSelesai, (_) => countTugasSelesai.value = listTugasSelesai.length);
    ever(listUploadBukti, (_) => countUploadBukti.value = listUploadBukti.length);
  }

  Future<void> _fetchInitialData() async {
    isLoading.value = true;
    isLoadingBelumSelesai.value = true;
    isLoadingSelesai.value = true;
    isLoadingUpload.value = true;

    await Future.wait([
      fetchDataTugasBaru(),
      fetchDataTugasBelumSelesai(),
      fetchTugasSelesai(),
      fetchUploadBukti(),
    ]);
    isLoading.value = false;
  }

  Future<void> fetchDataTugasBaru() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final List<AllTugasBaruModel> dataBaru = await _allTugasBaruService.getAllTugasBaruFromJson();
      listTugasBaru.assignAll(dataBaru);
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data tugas baru: $e';
      print('Error fetchDataTugasBaru: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDataTugasBelumSelesai() async {
    isLoadingBelumSelesai.value = true;
    errorMessageBelumSelesai.value = ''; 
    try {
      final List<TugasBelumSelesaiModel> databelumselesai = await _tugasBelumSelesaiService.getAllTugasBelumSelesaiFromJson();
      listTugasBelumSelesai.assignAll(databelumselesai);
    } catch (e) {
      errorMessageBelumSelesai.value = 'Gagal mengambil data tugas belum selesai: $e';
      print('Error fetchDataTugasBelumSelesai: $e');
    } finally {
      isLoadingBelumSelesai.value = false;
    }
  }

  Future<void> fetchTugasSelesai() async {
    isLoadingSelesai.value = true;
    errorMessageSelesai.value = ''; 
    try {
      final List<AllTugasSelesaiModel> dataSelesai = await _tugasSelesaiService.getAllTugasSelesaiFromJson();
      listTugasSelesai.assignAll(dataSelesai);
    } catch (e) {
      errorMessageSelesai.value = 'Gagal mengambil data tugas selesai: $e';
      print('Error fetchTugasSelesai: $e');
    } finally {
      isLoadingSelesai.value = false;
    }
  }

  Future<void> fetchUploadBukti() async {
    isLoadingUpload.value = true;
    errorMessageUpload.value = '';
    try {
      final List<AllUploadBuktiModel> dataUpload = await _uploadBuktiService.getAllUploadBuktiFromJson();
      listUploadBukti.assignAll(dataUpload);
    } catch (e) {
      errorMessageUpload.value = 'Gagal mengambil data upload bukti: $e';
      print('Error fetchUploadBukti: $e');
    } finally {
      isLoadingUpload.value = false;
    }
  }

  Future<void> refreshDashboardData() async {
    await _fetchInitialData();
  }
}