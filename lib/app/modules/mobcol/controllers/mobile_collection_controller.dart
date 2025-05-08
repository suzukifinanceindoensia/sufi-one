import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasbaru_controller.dart';

class MobileCollectionController extends GetxController {
  final logger = Logger();
  
  // Observable state
  var showCustomerInfo = true.obs;

  // Dropdown values
  var isMeetCustomer = ''.obs;
  var visitedAddress = ''.obs;
  var isAddressChanged = ''.obs;
  var isUnitAvailable = ''.obs;
  var willCustomerPay = ''.obs;

  // Methods
  void toggleView(bool showCustomer) {
    showCustomerInfo.value = showCustomer;
  }

  void submitCustomerInfo() {
    logger.i('Customer Info Submitted');
  }

  void submitCollectionForm() {
    logger.i('Collection Form Submitted');
  }

  void updateDropdownValue(String type, String value) {
    switch (type) {
      case 'meetCustomer':
        isMeetCustomer.value = value;
        break;
      case 'visitedAddress':
        visitedAddress.value = value;
        break;
      case 'addressChanged':
        isAddressChanged.value = value;
        break;
      case 'unitAvailable':
        isUnitAvailable.value = value;
        break;
      case 'customerWillPay':
        willCustomerPay.value = value;
        break;
    }
  }
}
