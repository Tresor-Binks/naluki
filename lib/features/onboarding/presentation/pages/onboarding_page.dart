import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/dots_indicator.dart';
import '../widgets/onboarding_illustration.dart';

/// Écran d'onboarding — "Découvrez les meilleurs lieux autour de vous".
///
/// Reproduction fidèle de la maquette : illustration, titre, sous-titre,
/// indicateur de pages, bouton "Suivant" et lien "Passer".
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: Column(
            children: [
              SizedBox(height: AppSpacing.xl),
              const Expanded(child: Center(child: OnboardingIllustration())),
              SizedBox(height: AppSpacing.xxl),
              Text(
                'Découvrez les meilleurs\nlieux autour de vous',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingLarge,
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Restaurants, hôtels, activités, événements et plus encore.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: AppSpacing.xl),
              const DotsIndicator(count: 3, activeIndex: 0),
              SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.goNamed(RouteNames.login),
                  child: const Text('Suivant'),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              TextButton(
                onPressed: () => context.goNamed(RouteNames.login),
                child: Text('Passer', style: AppTextStyles.label.copyWith(color: AppColors.textSecondary)),
              ),
              SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
