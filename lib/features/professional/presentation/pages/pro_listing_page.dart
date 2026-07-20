import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/rounded_image.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../widgets/pro_nav.dart';

/// Écran "Ma fiche" — édition de l'établissement (espace professionnel).
class ProListingPage extends StatelessWidget {
  const ProListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Ma fiche'),
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: proNavItems, currentIndex: 4, onTap: (i) => onProNavTap(context, i)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  RoundedImage(height: 140.h),
                  Positioned(
                    right: AppSpacing.sm,
                    bottom: AppSpacing.sm,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6.h),
                      decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.fullRadius),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_rounded, size: 14.sp, color: AppColors.primary),
                          SizedBox(width: 4.w),
                          Text('Modifier', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Nom de l’établissement', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const TextField(decoration: InputDecoration(hintText: 'Le Chill Restaurant')),
              SizedBox(height: AppSpacing.lg),

              Text('Catégorie', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: AppRadius.inputRadius),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Restaurant', style: AppTextStyles.bodyLarge),
                    const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              Text('Description', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(hintText: 'Restaurant lounge au cœur de Bacongo...'),
              ),
              SizedBox(height: AppSpacing.xxl),

              PrimaryButton(label: 'Enregistrer', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
