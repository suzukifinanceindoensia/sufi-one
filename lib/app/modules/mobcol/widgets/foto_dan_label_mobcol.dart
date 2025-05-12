import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolImageWithLabel extends StatelessWidget {
  final String text;
  final String imageUrl;
  final double heightin;
  final String coordinate;
  final double acuracy;

  const MobcolImageWithLabel({
    super.key,
    required this.heightin,
    required this.coordinate,
    required this.acuracy,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          height: heightin,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: AppTextStyles.bigBody,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(
              height: heightin,
              width: MediaQuery.sizeOf(context).width - 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 8),
                color: AppColors.bg2,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text("$coordinate",style: AppTextStyles.smallBody,),
            Text("Accuracy : $acuracy",style: AppTextStyles.smallBody,),
          ],
        ),
      ],
    );
  }
}

