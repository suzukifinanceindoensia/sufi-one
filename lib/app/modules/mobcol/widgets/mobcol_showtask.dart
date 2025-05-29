import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class Mobcol_showtask extends StatelessWidget {
  const Mobcol_showtask({
    super.key, 
    required this.children
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.bg1,
              AppColors.bg2,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.iconDefault,
            width: 1.6,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}