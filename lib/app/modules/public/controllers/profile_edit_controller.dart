import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  // Controllers for each field
  var name = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var address = ''.obs;

  // Password fields for when changing the password
  var currentPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  // Toggle for password change
  var isPasswordChange = false.obs;

  // Method to toggle the password change option
  void togglePasswordChange() {
    isPasswordChange.value = !isPasswordChange.value;
  }

  // Method to handle profile update (updating name, phone, email, address)
  void updateProfileInfo() {
    print(
      'Profile updated: Name: ${name.value}, Phone: ${phone.value}, Email: ${email.value}, Address: ${address.value}',
    );
    Get.snackbar('Success', 'Profile updated successfully');
  }

  // Method to handle password change (password validation logic)
  void changePassword() {
    if (newPassword.value == confirmPassword.value) {
      // Handle password change logic (e.g., API call)
      print("Password updated");
      Get.snackbar('Success', 'Password updated successfully');
    } else {
      // Show error if passwords don't match
      Get.snackbar('Error', 'Passwords do not match');
    }
  }

  // Combined method for saving, can be called in the view (handling both profile info and password)
  void saveProfile() {
    if (isPasswordChange.value) {
      changePassword();
    }
    updateProfileInfo();
  }
}
