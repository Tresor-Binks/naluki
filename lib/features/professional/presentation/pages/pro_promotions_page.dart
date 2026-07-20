import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../../../../core/widgets/status_badge.dart';
import '../widgets/pro_nav.dart';

/// Écran "Promotions" de l'espace professionnel.
class ProPromotionsPage extends StatelessWidget {
  const ProPromotionsPage({super.key});

  static const _promotions = [
    (title: '-20% sur les plats', period: '20 Mai - 30 Juin', active: true),
    (title: 'Happy Hour', period: '17h - 20h', active: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Promotions'),
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: proNavItems, currentIndex: 4, onTap: (i) => onProNavTap(context, i)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bannière promo en cours
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accentDark]),
                  borderRadius: AppRadius.cardRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('-20%', style: AppTextStyles.displayLarge.copyWith(color: Colors.white)),
                    Text('SUR LES PLATS', style: AppTextStyles.headingSmall.copyWith(color: Colors.white)),
                    SizedBox(height: 2.h),
                    Text('Du 20 Mai au 30 Juin', style: AppTextStyles.bodySmall.copyWith(color: Colors.white.withValues(alpha: 0.9))),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              PrimaryButton(label: 'Créer une promotion', onPressed: () {}),
              SizedBox(height: AppSpacing.xxl),

              Text('Mes promotions', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.md),
              ..._promotions.map(
                (promo) => Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.md),
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(promo.title, style: AppTextStyles.headingSmall),
                              Text(promo.period, style: AppTextStyles.bodySmall),
                            ],
                          ),
                        ),
                        StatusBadge(label: promo.active ? 'Active' : 'Inactive', tone: promo.active ? StatusTone.success : StatusTone.error),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
