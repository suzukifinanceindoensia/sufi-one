import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/anggota&registrasi/controllers/registrasi_controller.dart';

class RegistrasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrasiController>(() => RegistrasiController());
  }
}
