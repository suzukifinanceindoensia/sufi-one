import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/services/collection_service.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class SurveySplashController extends GetxController {
  var loading = true.obs;
  var loadingMessage = "".obs;

  final SurveyCollectionService _collectionService = Get.put(
    SurveyCollectionService(),
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    synchronize();
  }

  void synchronize() async {
    await _collectionService.syncCollections(
      onSync: (msg) => loadingMessage.value = msg,
      onDone: (isDone) {
        loading.value = !isDone;

        if (isDone) {
          Get.offNamed(AppRoutes.surveyHome); // ← redirect after done
        }
      },
    );
  }
}
