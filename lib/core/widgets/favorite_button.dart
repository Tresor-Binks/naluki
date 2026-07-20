import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_icons.dart';

/// Bouton favori (cœur) réutilisable — purement visuel pour l'instant
/// (état géré par le parent), la persistance viendra en Phase 2.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.isFavorite,
    required this.onPressed,
    this.size = 18,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? AppIcons.heartFilled : AppIcons.heart,
          color: isFavorite ? AppColors.favorite : AppColors.textTertiary,
          size: size.sp,
        ),
      ),
    );
  }
}
