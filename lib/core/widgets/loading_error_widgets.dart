import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'primary_button.dart';

/// Indicateur de chargement générique — Phase 2+ (appels API).
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.huge),
      child: Column(
        children: [
          const CircularProgressIndicator(color: AppColors.primary, strokeWidth: 2.5),
          if (message != null) ...[
            SizedBox(height: AppSpacing.md),
            Text(message!, style: AppTextStyles.bodyMedium),
          ],
        ],
      ),
    );
  }
}

/// État d'erreur générique avec action "Réessayer" — Phase 2+ (appels API).
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.huge),
      child: Column(
        children: [
          Icon(Icons.error_outline_rounded, size: 40.sp, color: AppColors.error),
          SizedBox(height: AppSpacing.md),
          Text(message, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            SizedBox(height: AppSpacing.lg),
            SecondaryButton(label: 'Réessayer', onPressed: onRetry, fullWidth: false),
          ],
        ],
      ),
    );
  }
}
