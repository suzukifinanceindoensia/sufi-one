import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MenuCreatorMobcol extends StatelessWidget {
  const MenuCreatorMobcol({
    super.key,
    required this.number,
    required this.title,
    required this.imageUrl,
  });

  final String number;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 120,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: AppColors.bg2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.iconDefault,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 55,
                  child: Text(number, style: AppTextStyles.MobcolNum),
                ),
                SizedBox(
                  height: 37,
                  child: Center(
                    child: Text(title, style: AppTextStyles.medBody, textAlign: TextAlign.center,),
                  ) 
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Opacity(opacity: 0.5, child: Image.network(imageUrl, height: 70,width: 70,fit: BoxFit.cover,),),
          ],
        ),
      ),
    );
  }
}