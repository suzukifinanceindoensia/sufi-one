import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class MobcolAppButtonStyle {
  static ButtonStyle goodButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.button,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
  static ButtonStyle evilButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.button2,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}