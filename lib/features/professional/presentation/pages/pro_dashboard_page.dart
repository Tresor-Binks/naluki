import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadows.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../widgets/pro_nav.dart';

/// Tableau de bord de l'espace professionnel ("Bonjour, Le Chill Restaurant").
class ProDashboardPage extends StatelessWidget {
  const ProDashboardPage({super.key});

  static const _weeklyViews = [40.0, 65.0, 50.0, 80.0, 55.0, 90.0, 70.0];
  static const _days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord')),
      bottomNavigationBar: SimpleBottomNavBar(
        items: proNavItems,
        currentIndex: 0,
        onTap: (i) => onProNavTap(context, i),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bonjour, Le Chill Restaurant 👋', style: AppTextStyles.headingLarge),
              SizedBox(height: AppSpacing.xxl),
              Row(
                children: [
                  Expanded(child: const _StatTile(label: 'Vues', value: '2 456', delta: '+12%')),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(child: const _StatTile(label: 'Recherches', value: '892', delta: '+8%')),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(child: const _StatTile(label: 'Appels', value: '156', delta: '+15%')),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),
              Text('Vues sur 7 jours', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.md),
              Container(
                height: 140.h,
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius, boxShadow: AppShadows.card),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(_weeklyViews.length, (i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 18.w,
                          height: _weeklyViews[i].h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(_days[i], style: AppTextStyles.caption),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, required this.delta});

  final String label;
  final String value;
  final String delta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius, boxShadow: AppShadows.card),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.bodySmall),
          SizedBox(height: 4.h),
          Text(value, style: AppTextStyles.headingSmall),
          Text(delta, style: AppTextStyles.caption.copyWith(color: AppColors.success)),
        ],
      ),
    );
  }
}
