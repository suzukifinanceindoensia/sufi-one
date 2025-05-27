import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MenuCreatorMobcol extends StatelessWidget {
  const MenuCreatorMobcol({
    super.key,
    required this.number,
    required this.title,
    required this.imageAddress,
  });

  final RxInt number;
  final String title;
  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 130,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.bg1,
              AppColors.bg2,
            ],
            begin: Alignment.topLeft,
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
              blurRadius: 7,
              offset: Offset(1, 5),
            ),
          ],

        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                  child: Obx(
                    () => Text(
                      // Akses nilai dari RxInt
                      '${number.value}',
                      style: AppTextStyles.MobcolNum
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(title, style: AppTextStyles.medBody, textAlign: TextAlign.center,),
                  ) 
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Opacity(opacity: 0.6, child: Image.asset(imageAddress, height: 80,width: 80,fit: BoxFit.cover,),),
          ],
        ),
      ),
    );
  }
}