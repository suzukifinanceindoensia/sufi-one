import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ProfileMobcol extends StatelessWidget {
  const ProfileMobcol({
    super.key,
    required this.image,
    required this.name,
    required this.username,
    required this.profession,
    required this.borders,
  });
  final double borders;
  final String image;
  final String name;
  final String username;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bg2, AppColors.bg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borders),
            topRight: Radius.circular(borders),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.all(
            color: Colors.black,
            width: 1.6,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(1, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                image,
              ),
              radius: 70,
            ),
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: AppTextStyles.bigBody,
                  textAlign: TextAlign.right,
                ),
                Text(
                  username,
                  style: AppTextStyles.medBody,
                  textAlign: TextAlign.right,
                ),
                Expanded(child: SizedBox()),
                Text(
                  profession,
                  style: AppTextStyles.medBody,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}