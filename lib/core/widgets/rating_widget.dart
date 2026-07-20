import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_icons.dart';
import '../theme/app_text_styles.dart';

/// Affiche une note ("★ 4.6 (128 avis)") — utilisé sur les cartes de lieux
/// et l'écran de détail.
class RatingWidget extends StatelessWidget {
  const RatingWidget({
    required this.rating,
    this.reviewCount,
    this.compact = false,
    super.key,
  });

  final double rating;
  final int? reviewCount;

  /// Version compacte (sans le nombre d'avis), pour les petites cartes.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(AppIcons.star, color: AppColors.rating, size: 14.sp),
        SizedBox(width: 3.w),
        Text(rating.toStringAsFixed(1), style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary)),
        if (!compact && reviewCount != null) ...[
          SizedBox(width: 2.w),
          Text('($reviewCount avis)', style: AppTextStyles.caption),
        ],
      ],
    );
  }
}
