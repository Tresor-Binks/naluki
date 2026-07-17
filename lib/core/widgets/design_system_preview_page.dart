import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_icons.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';
import '../constants/app_sizes.dart';
import '../constants/app_spacing.dart';
import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Page de démonstration **temporaire** du Design System.
///
/// Objectif : permettre de valider visuellement que les couleurs, la
/// typographie, les rayons, les ombres et les composants de base
/// correspondent bien à la maquette, avant de commencer le routing et les
/// vraies pages. Cette page sera supprimée dès l'étape "Navigation".
class DesignSystemPreviewPage extends StatelessWidget {
  const DesignSystemPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System — Naluki')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('Typographie'),
            Text('Découvrez.', style: AppTextStyles.displayLarge),
            SizedBox(height: AppSpacing.xs),
            Text('Bienvenue 👋', style: AppTextStyles.headingLarge),
            SizedBox(height: AppSpacing.xs),
            Text('Recommandé pour vous', style: AppTextStyles.headingMedium),
            SizedBox(height: AppSpacing.xs),
            Text('Le Chill Restaurant', style: AppTextStyles.headingSmall),
            SizedBox(height: AppSpacing.xs),
            Text('Naluki est votre assistant intelligent...', style: AppTextStyles.bodyLarge),
            Text('Cuisine africaine • Bacongo', style: AppTextStyles.bodyMedium),
            Text('15–25 min', style: AppTextStyles.bodySmall),
            Text('FIND YOUR PLACE', style: AppTextStyles.overline),
            SizedBox(height: AppSpacing.sectionGap),

            const _SectionTitle('Couleurs'),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _ColorSwatch('primary', AppColors.primary),
                _ColorSwatch('primaryDark', AppColors.primaryDark),
                _ColorSwatch('accent', AppColors.accent),
                _ColorSwatch('background', AppColors.background, border: true),
                _ColorSwatch('surface', AppColors.surface, border: true),
                _ColorSwatch('textPrimary', AppColors.textPrimary),
                _ColorSwatch('textSecondary', AppColors.textSecondary),
                _ColorSwatch('success', AppColors.success),
                _ColorSwatch('warning', AppColors.warning),
                _ColorSwatch('error', AppColors.error),
              ],
            ),
            SizedBox(height: AppSpacing.sectionGap),

            const _SectionTitle('Boutons'),
            ElevatedButton(onPressed: () {}, child: const Text('Suivant')),
            SizedBox(height: AppSpacing.sm),
            OutlinedButton(onPressed: () {}, child: const Text('Continuer avec Google')),
            SizedBox(height: AppSpacing.sm),
            TextButton(onPressed: () {}, child: const Text('Passer')),
            SizedBox(height: AppSpacing.sectionGap),

            const _SectionTitle('Carte (radius + ombre)'),
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.cardRadius,
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Container(
                    width: AppSizes.categoryCardSize,
                    height: AppSizes.categoryCardSize,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: AppRadius.cardRadius,
                    ),
                    child: Icon(AppIcons.location, color: AppColors.primary),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Le Chill Restaurant', style: AppTextStyles.headingSmall),
                        Text('Bacongo', style: AppTextStyles.bodyMedium),
                        Row(
                          children: [
                            Icon(AppIcons.star, size: AppSizes.iconXs, color: AppColors.rating),
                            SizedBox(width: 4.w),
                            Text('4.6 (128)', style: AppTextStyles.caption),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(AppIcons.heart, color: AppColors.favorite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(text, style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary)),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch(this.label, this.color, {this.border = false});

  final String label;
  final Color color;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: border ? Border.all(color: AppColors.border) : null,
          ),
        ),
        SizedBox(height: 4.h),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
