import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Étiquette non interactive réutilisable (catégorie, tag) — à ne pas
/// confondre avec [AppFilterChip], qui est sélectionnable.
class TagChip extends StatelessWidget {
  const TagChip({required this.label, this.tone, super.key});

  final String label;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4),
      decoration: BoxDecoration(
        color: (tone ?? AppColors.primary).withValues(alpha: 0.1),
        borderRadius: AppRadius.fullRadius,
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: tone ?? AppColors.primary, fontWeight: FontWeight.w600),
      ),
    );
  }
}
