import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadows.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../widgets/admin_nav.dart';

/// Écran "Statistiques globales" (back-office admin).
class AdminStatsPage extends StatelessWidget {
  const AdminStatsPage({super.key});

  static const _stats = [
    (label: 'Utilisateurs', value: '12 458', delta: '+18%'),
    (label: 'Lieux', value: '3 245', delta: '+11%'),
    (label: 'Réservations', value: '1 245', delta: '+22%'),
    (label: 'Revenus', value: '2 450 000 FCFA', delta: '+16%'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Statistiques globales'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSpacing.pageHorizontal),
            child: Center(child: Text('Cette semaine', style: AppTextStyles.caption)),
          ),
        ],
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: adminNavItems, currentIndex: 0, onTap: (i) => onAdminNavTap(context, i)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.5,
            children: _stats
                .map(
                  (s) => Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius, boxShadow: AppShadows.card),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(s.label, style: AppTextStyles.bodySmall),
                        Text(s.value, style: AppTextStyles.headingMedium),
                        Text(s.delta, style: AppTextStyles.caption.copyWith(color: AppColors.success)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
