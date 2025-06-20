import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart'; // Assuming AppColors
import 'package:sufi_one/app/theme/fontstyle.dart'; // Assuming AppTextStyles

class ProfileMobcol extends StatelessWidget {
  const ProfileMobcol({
    super.key,
    required this.imageroute,
    required this.name,
    required this.username,
    required this.profession,
    this.borders = 0,
  });

  final double borders;
  final String imageroute;
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
          color: AppColors.bg2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borders), 
            topRight: Radius.circular(borders),
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
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
              radius: 50,
              backgroundColor: Colors.grey[200],
              child: ClipOval( // Ensure the image/icon is clipped to a circle
                child: Image.asset(
                  imageroute,
                  fit: BoxFit.cover,
                  width: 100, // Twice the radius
                  height: 100, // Twice the radius
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey[600],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center, // Vertically center the text
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bigBody.copyWith(fontWeight: FontWeight.bold), // Bold name
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis, // Handle long names
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4), // Small spacing
                  Text(
                    username,
                    style: AppTextStyles.medBody.copyWith(color: Colors.grey[700]), // Slightly muted username
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8), // More spacing
                  Text(
                    profession,
                    style: AppTextStyles.medBody.copyWith(fontStyle: FontStyle.italic), // Italic profession
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}