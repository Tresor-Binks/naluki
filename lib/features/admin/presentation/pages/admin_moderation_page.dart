import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../widgets/admin_nav.dart';

/// Écran "Modération des lieux" (back-office admin).
class AdminModerationPage extends StatelessWidget {
  const AdminModerationPage({super.key});

  static const _pending = [
    (name: 'Chez Maman', category: 'Restaurant • Bacongo', date: '25/05/2024'),
    (name: 'Bar La Joie', category: 'Bar • Poto-Poto', date: '25/05/2024'),
    (name: 'Hôtel Peace', category: 'Hôtel • Centre-ville', date: '25/05/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Modération lieux'),
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: adminNavItems, currentIndex: 2, onTap: (i) => onAdminNavTap(context, i)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lieux à vérifier', style: AppTextStyles.headingMedium),
                  Text('${_pending.length} en attente', style: AppTextStyles.caption.copyWith(color: AppColors.warning)),
                ],
              ),
              SizedBox(height: AppSpacing.lg),
              Expanded(
                child: ListView.separated(
                  itemCount: _pending.length,
                  separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                  itemBuilder: (context, index) {
                    final place = _pending[index];
                    return Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                      child: Row(
                        children: [
                          Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: BoxDecoration(color: AppColors.warningLight, borderRadius: AppRadius.inputRadius),
                            child: Icon(AppIcons.location, color: AppColors.warning, size: 20.sp),
                          ),
                          SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(place.name, style: AppTextStyles.headingSmall),
                                Text(place.category, style: AppTextStyles.bodySmall),
                                Text('Ajouté le ${place.date}', style: AppTextStyles.caption),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(minimumSize: Size(0, 32.h), padding: EdgeInsets.symmetric(horizontal: AppSpacing.md)),
                            onPressed: () {},
                            child: const Text('Vérifier'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
