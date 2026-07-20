import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/avatar_widget.dart';
import '../../../../core/widgets/rating_widget.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../widgets/pro_nav.dart';

/// Écran "Avis clients" de l'espace professionnel.
class ProReviewsPage extends StatelessWidget {
  const ProReviewsPage({super.key});

  static const _breakdown = [(stars: 5, percent: 0.70), (stars: 4, percent: 0.14), (stars: 3, percent: 0.05), (stars: 2, percent: 0.01), (stars: 1, percent: 0.01)];

  static const _reviews = [
    (author: 'Sonia B.', comment: 'Très bon restaurant ! Ambiance top et plats délicieux.', when: 'il y a 2 jours'),
    (author: 'Patrick L.', comment: 'Service impeccable 🙌', when: 'il y a 1 semaine'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Avis clients'),
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: proNavItems, currentIndex: 1, onTap: (i) => onProNavTap(context, i)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('4.6', style: AppTextStyles.displayLarge),
                      const RatingWidget(rating: 4.6, compact: true),
                      SizedBox(height: 2.h),
                      Text('(128 avis)', style: AppTextStyles.caption),
                    ],
                  ),
                  SizedBox(width: AppSpacing.xxl),
                  Expanded(
                    child: Column(
                      children: _breakdown
                          .map(
                            (b) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Row(
                                children: [
                                  Text('${b.stars}', style: AppTextStyles.caption),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: LinearProgressIndicator(
                                        value: b.percent,
                                        minHeight: 6.h,
                                        backgroundColor: AppColors.surfaceMuted,
                                        color: AppColors.rating,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text('${(b.percent * 100).round()}%', style: AppTextStyles.caption),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),

              ..._reviews.map(
                (review) => Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.lg),
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AvatarWidget(name: review.author, size: 40),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(review.author, style: AppTextStyles.headingSmall),
                                  Text(review.when, style: AppTextStyles.caption),
                                ],
                              ),
                              const RatingWidget(rating: 5, compact: true),
                              SizedBox(height: 4.h),
                              Text(review.comment, style: AppTextStyles.bodyMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(onPressed: () {}, child: const Text('Voir tout')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
