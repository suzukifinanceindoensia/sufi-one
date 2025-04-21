import 'package:get/get.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class HomepageCustControllers extends GetxController {
  void onMenuSelected(String value) {
    print('Menu dipilih: $value');
    switch (value) {
      case 'Mobile Collection':
        Get.toNamed(AppRoutes.mobileCollection);
        break;
      case 'Mobile Survey':
        // navigasi lainnya jika sudah ada rutenya
        break;
      case 'Mobile Smile':
        break;

      default:
        break;
    }
  }
}
