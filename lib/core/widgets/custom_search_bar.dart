import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_radius.dart';
import '../theme/app_text_styles.dart';

/// Barre de recherche réutilisable (Accueil, Explorer, Carte...).
///
/// En lecture seule ([onTap] fourni) elle sert de raccourci vers l'écran de
/// recherche ; en saisie directe, fournir [onChanged] à la place.
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.trailing,
    super.key,
  });

  final String hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: AppRadius.inputRadius,
      ),
      child: Row(
        children: [
          SizedBox(width: 14.w),
          Icon(AppIcons.search, color: AppColors.textTertiary, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: onTap != null
                ? GestureDetector(
                    onTap: onTap,
                    child: AbsorbPointer(
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration.collapsed(
                          hintText: hintText,
                          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
                        ),
                      ),
                    ),
                  )
                : TextField(
                    onChanged: onChanged,
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
                    ),
                  ),
          ),
          if (trailing != null) trailing!,
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
