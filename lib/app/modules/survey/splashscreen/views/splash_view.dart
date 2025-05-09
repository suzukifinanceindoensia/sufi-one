import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SurveySplashView extends GetView<SurveySplashController> {
  const SurveySplashView({Key? key}) : super(key: key);

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
                          SizedBox(height: 50),
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
