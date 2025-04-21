import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class Button {
  static final ButtonStyle elevbutton = ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)), // Make corners square
          ),
        );
}