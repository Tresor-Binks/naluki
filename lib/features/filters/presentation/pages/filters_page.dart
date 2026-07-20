import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/category_card.dart';

/// Écran Filtres (catégories, distance, prix, note minimale).
class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  double _distance = 5;
  int _priceLevel = 2; // 1 à 4 ($ à $$$$)
  int _minRating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Filtres'),
        actions: [
          TextButton(
            onPressed: () => setState(() {
              _distance = 5;
              _priceLevel = 2;
              _minRating = 3;
            }),
            child: const Text('Réinitialiser'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Catégories', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.md),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(icon: Icons.restaurant_rounded, label: 'Restaurants'),
                  CategoryCard(icon: Icons.hotel_rounded, label: 'Hôtels'),
                  CategoryCard(icon: Icons.local_bar_rounded, label: 'Bars'),
                  CategoryCard(icon: Icons.local_activity_rounded, label: 'Activités'),
                  CategoryCard(icon: Icons.room_service_rounded, label: 'Services'),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Distance', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.sm),
              Slider(
                value: _distance,
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.surfaceMuted,
                label: '${_distance.round()} km',
                onChanged: (value) => setState(() => _distance = value),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 km', style: AppTextStyles.caption),
                  Text('10 km', style: AppTextStyles.caption),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Prix', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.md),
              Row(
                children: List.generate(4, (index) {
                  final level = index + 1;
                  final selected = level == _priceLevel;
                  return Padding(
                    padding: EdgeInsets.only(right: AppSpacing.sm),
                    child: GestureDetector(
                      onTap: () => setState(() => _priceLevel = level),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: selected ? AppColors.primary : AppColors.surfaceMuted,
                          borderRadius: AppRadius.fullRadius,
                        ),
                        child: Text(
                          '\$' * level,
                          style: AppTextStyles.label.copyWith(
                            color: selected ? AppColors.textOnPrimary : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Note minimale', style: AppTextStyles.headingMedium),
              SizedBox(height: AppSpacing.md),
              Row(
                children: List.generate(4, (index) {
                  final stars = index + 1;
                  final selected = stars == _minRating;
                  return Padding(
                    padding: EdgeInsets.only(right: AppSpacing.sm),
                    child: GestureDetector(
                      onTap: () => setState(() => _minRating = stars),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: selected ? AppColors.primary : AppColors.surfaceMuted,
                          borderRadius: AppRadius.fullRadius,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 14.sp,
                              color: selected ? AppColors.textOnPrimary : AppColors.rating,
                            ),
                            Text(
                              ' $stars+',
                              style: AppTextStyles.label.copyWith(
                                color: selected ? AppColors.textOnPrimary : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSpacing.huge),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Voir 128 résultats'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
