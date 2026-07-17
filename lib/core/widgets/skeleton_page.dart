import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Squelette générique utilisé par toutes les pages en attendant l'étape
/// "Pages statiques" (reproduction pixel-perfect de la maquette).
///
/// Objectif de cette étape : uniquement valider que **la navigation
/// fonctionne** (routes, retour, bottom navigation). Chaque page sera
/// remplacée individuellement, sans toucher au routing.
class SkeletonPage extends StatelessWidget {
  const SkeletonPage({
    required this.title,
    this.subtitle,
    this.actions,
    this.showBackButton = false,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<SkeletonAction>? actions;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : null,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: AppRadius.cardRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('🚧  $title', style: AppTextStyles.headingMedium),
                  if (subtitle != null) ...[
                    SizedBox(height: AppSpacing.xs),
                    Text(subtitle!, style: AppTextStyles.bodyMedium),
                  ],
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'Page statique en attente (étape suivante). '
                    'La navigation, elle, est déjà fonctionnelle.',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            if (actions != null) ...[
              SizedBox(height: AppSpacing.xxl),
              Text('Navigation à tester :', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: actions!
                    .map(
                      (action) => ElevatedButton(
                        onPressed: action.onPressed,
                        child: Text(action.label),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Décrit un bouton de navigation affiché sur une [SkeletonPage].
class SkeletonAction {
  const SkeletonAction({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;
}
