import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadows.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Petite carte "Parcours populaires" affichée sur l'Accueil et l'écran
/// Parcours & Expériences.
class ItineraryPreviewCard extends StatelessWidget {
  const ItineraryPreviewCard({
    required this.title,
    required this.subtitle,
    required this.count,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final String count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: AppRadius.cardRadius,
          boxShadow: AppShadows.soft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.headingSmall),
            Text(subtitle, style: AppTextStyles.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(count, style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
