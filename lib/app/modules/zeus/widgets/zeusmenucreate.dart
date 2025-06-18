import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

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
      color: AppColors.navBackground,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      itemCount.toString(),
                      style: AppTextStyles.MobcolNum.copyWith(
                        color: AppColors.bg3, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      menuTitle,
                      style: AppTextStyles.bigBody.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], 
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), 
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey[400],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}