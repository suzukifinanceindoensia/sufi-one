import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ProfileCardMobcol extends StatelessWidget {
  const ProfileCardMobcol({
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
            colors: [AppColors.splashStart, AppColors.splashEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borders),
            topRight: Radius.circular(borders),
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