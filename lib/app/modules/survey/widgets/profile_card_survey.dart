import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.splashStart, AppColors.splashEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: const Border(
            bottom: BorderSide(color: Colors.black26, width: 1),
            left: BorderSide(color: Colors.black26, width: 1),
            right: BorderSide(color: Colors.black26, width: 1),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/91/20/d2/9120d2a990a4a0fe4afbe6241376cbae.jpg",),              
                  radius: 100,
            ),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "JON SUZUKI",
                    style: AppTextStyles.bigBody,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "@jon.suzuki",
                    style: AppTextStyles.medBody,
                  ),
                ),
                Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Profesional Surveyor",
                    style: AppTextStyles.medBody,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}