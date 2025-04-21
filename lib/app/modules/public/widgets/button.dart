import 'package:flutter/material.dart';

class normalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  final double tinggi;
  final double lebar;

  normalButton({
    required this.onPressed,
    required this.child,
    this.color,
    this.lebar= 300,
    this.tinggi = 35,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lebar,
      height: tinggi,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
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


