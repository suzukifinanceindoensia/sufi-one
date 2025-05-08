import 'package:get/get.dart';

class SurveySplashController extends GetxController {
  var loading = true.obs;
  var loadingMessage = "Loading master data...".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _synchronizeData();
  }

  void _synchronizeData() async {
    await Future.delayed(Duration(seconds: 2));
    loadingMessage.value = "Done!";
    await Future.delayed(Duration(seconds: 1));
    loading.value = false;
  }
}
