import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/favorite_button.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../../core/widgets/rating_widget.dart';
import '../../../../core/widgets/rounded_image.dart';
import '../../../../core/widgets/status_badge.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/place_providers.dart';

/// Écran de détail d'un lieu (route `/place/:placeId`).
class PlaceDetailPage extends ConsumerWidget {
  const PlaceDetailPage({required this.placeId, super.key});

  final String placeId;

  static const _amenities = [
    (icon: AppIcons.wifi, label: 'Wi-Fi'),
    (icon: AppIcons.parking, label: 'Parking'),
    (icon: AppIcons.terrace, label: 'Terrasse'),
    (icon: AppIcons.music, label: 'Musique'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesAsync = ref.watch(placesProvider);
    final place = ref.watch(placeByIdProvider(placeId));

    if (placesAsync.isLoading) return const Scaffold(body: LoadingWidget());
    if (place == null) return const Scaffold(body: AppErrorWidget(message: 'Lieu introuvable.'));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedImage(
                  assetPath: place.imageAsset,
                  height: 220.h,
                  borderRadius: BorderRadius.zero,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(place.name, style: AppTextStyles.headingLarge)),
                          FavoriteButton(
                            isFavorite: place.isFavorite,
                            onPressed: () => ref.read(favoritesControllerProvider.notifier).toggle(place.id),
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(place.subtitle, style: AppTextStyles.bodyMedium),
                      SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          RatingWidget(rating: place.rating, reviewCount: place.reviewCount),
                          SizedBox(width: AppSpacing.sm),
                          const StatusBadge(label: 'Très bien'),
                        ],
                      ),
                      SizedBox(height: AppSpacing.lg),
                      Row(
                        children: [
                          Icon(AppIcons.clock, size: 16.sp, color: AppColors.textSecondary),
                          SizedBox(width: 4.w),
                          Text('${place.durationLabel} • Distance', style: AppTextStyles.bodySmall),
                          SizedBox(width: AppSpacing.lg),
                          Text('\$\$ Prix moyen', style: AppTextStyles.bodySmall),
                          SizedBox(width: AppSpacing.lg),
                          const StatusBadge(label: 'Ouvert', tone: StatusTone.success),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xxl),

                      Text('À propos', style: AppTextStyles.headingMedium),
                      SizedBox(height: AppSpacing.sm),
                      Text(
                        'Restaurant lounge au cœur de ${place.area}. '
                        'Ambiance chaleureuse et plats savoureux, idéal pour un déjeuner '
                        'entre amis ou un dîner en famille.',
                        style: AppTextStyles.bodyMedium,
                      ),
                      SizedBox(height: AppSpacing.xxl),

                      Text('Équipements', style: AppTextStyles.headingMedium),
                      SizedBox(height: AppSpacing.md),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _amenities
                            .map(
                              (a) => Column(
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 48.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.surfaceMuted,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(a.icon, color: AppColors.primary, size: 20.sp),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(a.label, style: AppTextStyles.caption),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // AppBar transparente flottante (retour + favori)
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            left: AppSpacing.pageHorizontal,
            right: AppSpacing.pageHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleIconButton(icon: AppIcons.back, onTap: () => context.pop()),
                _CircleIconButton(
                  icon: AppIcons.play,
                  onTap: () => context.pushNamed(RouteNames.video, pathParameters: {'placeId': place.id}),
                ),
              ],
            ),
          ),

          // Bouton "Réserver une table" flottant en bas
          Positioned(
            left: AppSpacing.pageHorizontal,
            right: AppSpacing.pageHorizontal,
            bottom: AppSpacing.lg,
            child: ElevatedButton(
              onPressed: () => context.pushNamed(RouteNames.booking, pathParameters: {'placeId': place.id}),
              child: const Text('Réserver une table'),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: const BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
        child: Icon(icon, size: 18.sp, color: AppColors.textPrimary),
      ),
    );
  }
}
