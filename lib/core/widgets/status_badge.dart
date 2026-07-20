import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Sémantique visuelle d'un [StatusBadge].
enum StatusTone { success, warning, error, info }

/// Petite pastille de statut réutilisable ("Ouvert", "Très bien",
/// "Confirmée", "En attente", "Annulée"...).
class StatusBadge extends StatelessWidget {
  const StatusBadge({required this.label, this.tone = StatusTone.success, super.key});

  final String label;
  final StatusTone tone;

  Color get _bg {
    switch (tone) {
      case StatusTone.success:
        return AppColors.successLight;
      case StatusTone.warning:
        return AppColors.warningLight;
      case StatusTone.error:
        return AppColors.errorLight;
      case StatusTone.info:
        return AppColors.primaryLight;
    }
  }

  Color get _fg {
    switch (tone) {
      case StatusTone.success:
        return AppColors.success;
      case StatusTone.warning:
        return AppColors.warning;
      case StatusTone.error:
        return AppColors.error;
      case StatusTone.info:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4.h),
      decoration: BoxDecoration(color: _bg, borderRadius: AppRadius.fullRadius),
      child: Text(label, style: AppTextStyles.caption.copyWith(color: _fg, fontWeight: FontWeight.w600)),
    );
  }
}
