import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

/// Avatar réutilisable — affiche une image si fournie, sinon les initiales
/// du nom sur un fond teinté.
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    required this.name,
    this.imageAsset,
    this.size = 56,
    super.key,
  });

  final String name;
  final String? imageAsset;
  final double size;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = size.r;

    if (imageAsset != null) {
      return ClipOval(
        child: Image.asset(imageAsset!, width: dimension, height: dimension, fit: BoxFit.cover),
      );
    }

    return Container(
      width: dimension,
      height: dimension,
      decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: dimension * 0.36,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
