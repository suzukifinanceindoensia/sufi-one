import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class normalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double tinggi;
  final double lebar;

  normalButton({
    required this.onPressed,
    required this.child,
    this.lebar= 300,
    this.tinggi = 45,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lebar,
      height: tinggi,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)), // Make corners square
          ),
        ),
        child: child,
      ),
    );
  }
}

