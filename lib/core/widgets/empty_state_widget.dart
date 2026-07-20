import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// État vide générique réutilisable (aucun résultat, aucun favori...).
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.icon,
    required this.title,
    this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.huge),
      child: Column(
        children: [
          Icon(icon, size: 48.sp, color: AppColors.textTertiary),
          SizedBox(height: AppSpacing.md),
          Text(title, style: AppTextStyles.headingSmall, textAlign: TextAlign.center),
          if (subtitle != null) ...[
            SizedBox(height: AppSpacing.xs),
            Text(subtitle!, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
