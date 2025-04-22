import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class AppButtonStyle {
  static ButtonStyle primaryButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.button,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}