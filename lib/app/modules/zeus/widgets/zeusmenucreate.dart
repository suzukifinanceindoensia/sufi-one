import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart'; // Assuming you have AppColors defined here
import 'package:sufi_one/app/theme/fontstyle.dart'; // Assuming you have AppTextStyles defined here

class ZeusMenuCreate extends StatelessWidget {
  final String image;
  final String menuTitle;
  final int itemCount;
  final VoidCallback? onTap; 

  const ZeusMenuCreate({
    super.key,
    required this.image,
    required this.menuTitle,
    required this.itemCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), 
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0), 
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 170,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.bg2,                  
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                children: [
                  Text(
                      itemCount.toString(),
                      style: AppTextStyles.MobcolNum.copyWith(
                        color: AppColors.bg3,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    menuTitle,
                    style: AppTextStyles.bigBody.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800], 
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              ),
              Expanded(child: SizedBox()),
              const SizedBox(width: 15),
              Image.asset(image, width: 100, height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}