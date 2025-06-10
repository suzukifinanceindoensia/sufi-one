import 'package:get/get.dart';
import 'dart:async';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';

class PermohonanSkController extends GetxController {
  var isLoading = false.obs;

  Future<void> fetchAgents() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    print('Fetching agents...');
    isLoading.value = false;
  }
}
