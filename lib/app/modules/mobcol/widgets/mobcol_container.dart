import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class MobcolContainer extends StatelessWidget {
  const MobcolContainer({
    super.key, 
    required this.children
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.iconDefault,
          width: 2,
        ),
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