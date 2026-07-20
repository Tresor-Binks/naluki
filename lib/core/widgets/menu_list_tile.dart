import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Ligne de menu réutilisable (Profil, Paramètres...).
class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.icon,
    required this.label,
    this.onTap,
    this.tintColor,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  /// Couleur d'accent optionnelle (ex. rouge pour "Se déconnecter").
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    final color = tintColor ?? AppColors.textPrimary;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: tintColor ?? AppColors.textSecondary),
            SizedBox(width: AppSpacing.md),
            Expanded(child: Text(label, style: AppTextStyles.bodyLarge.copyWith(color: color))),
            Icon(AppIcons.chevronRight, size: 18.sp, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}
