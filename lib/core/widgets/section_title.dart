import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Titre de section réutilisable ("Recommandé pour vous", "Voir tout"...).
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    this.actionLabel,
    this.onActionTap,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headingMedium),
        if (actionLabel != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(actionLabel!, style: AppTextStyles.label.copyWith(color: AppColors.primary)),
          ),
      ],
    );
  }
}
