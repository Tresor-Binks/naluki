import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

/// Image arrondie réutilisable (cartes de lieux, hero, avatars rectangulaires).
///
/// Si [assetPath] est `null` (pas encore de vraie photo fournie), affiche un
/// placeholder discret plutôt qu'un espace vide — jamais d'image codée en
/// dur, jamais de crash sur asset manquant.
class RoundedImage extends StatelessWidget {
  const RoundedImage({
    required this.height,
    this.assetPath,
    this.width = double.infinity,
    this.borderRadius,
    super.key,
  });

  final String? assetPath;
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(14.r);

    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        height: height,
        width: width,
        child: assetPath != null
            ? Image.asset(assetPath!, fit: BoxFit.cover)
            : Container(
                color: AppColors.surfaceMuted,
                child: Icon(Icons.image_rounded, color: AppColors.textTertiary, size: 32.sp),
              ),
      ),
    );
  }
}
