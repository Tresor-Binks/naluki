import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';

/// Carte de catégorie ronde + libellé ("Restaurants", "Hôtels"...).
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.icon,
    required this.label,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSizes.categoryCardSize,
            height: AppSizes.categoryCardSize,
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: AppSizes.iconLg),
          ),
          SizedBox(height: 6.h),
          Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}
