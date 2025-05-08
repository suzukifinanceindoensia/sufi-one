import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/models/splash_model.dart';

class SurveySplashController extends GetxController {
  var loading = true.obs;
  var loadingMessage = "".obs;

  final SurveySplashModel _model = SurveySplashModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    synchronize();
  }

  void synchronize() async {
    await _model.synchronizeMasterData(
      onMessageUpdate: (msg) => loadingMessage.value = msg,
    );

    await Future.delayed(Duration(seconds: 1));
    loading.value = false;
  }
}
