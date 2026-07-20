import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Ligne sélectionnable pour une méthode de paiement (Airtel Money, MTN
/// Mobile Money, Carte bancaire, Espèces...).
class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.subtitle,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 22.sp),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary)),
                  if (subtitle != null) Text(subtitle!, style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: selected ? AppColors.primary : AppColors.textTertiary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
