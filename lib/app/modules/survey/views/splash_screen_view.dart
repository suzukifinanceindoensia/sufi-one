import 'package:flutter/material.dart';
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

class SurveySplashView extends StatelessWidget {
  final controller = Get.put(SurveySplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003399),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "res/images/survey/logo_horizontal.png",
              color: Colors.white,
            ),
          ),
          Obx(
            () =>
                controller.loading.value
                    ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Color(0xFFEEEEEE)),
                          SizedBox(height: 10),
                          Text(
                            controller.loadingMessage.value,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),
          ),
        ],
      ),
    );
  }
}
