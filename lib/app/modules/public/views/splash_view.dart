import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import '../../../routes/app_routes.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.publicHome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //const Color.fromARGB(255, 25, 10, 240),
              //const Color.fromARGB(255, 112, 190, 236),
              AppColors.bg2,
              AppColors.bg1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(),
                )
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Image.asset('res/images/splashscreen.png'),
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(color: AppColors.button),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Image.asset('res/images/ojk1.png'),
                  ),
                )
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
