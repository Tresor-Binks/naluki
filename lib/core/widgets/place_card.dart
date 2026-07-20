import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/place/domain/models/place_model.dart';
import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';
import '../constants/app_sizes.dart';
import '../constants/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'favorite_button.dart';
import 'rating_widget.dart';
import 'rounded_image.dart';

/// Mise en forme de [PlaceCard] : grande carte "hero" ou ligne compacte.
enum PlaceCardVariant { hero, list }

/// Carte de lieu réutilisable (restaurant, hôtel, bar...).
///
/// - [PlaceCardVariant.hero] : grande image + infos dessous (section
///   "Recommandé pour vous").
/// - [PlaceCardVariant.list] : ligne compacte avec vignette (Explorer,
///   Favoris, résultats de recherche).
class PlaceCard extends StatelessWidget {
  const PlaceCard({
    required this.place,
    this.variant = PlaceCardVariant.list,
    this.onTap,
    this.onFavoriteTap,
    super.key,
  });

  final PlaceModel place;
  final PlaceCardVariant variant;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: variant == PlaceCardVariant.hero ? _buildHero() : _buildList(),
    );
  }

  Widget _buildHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            RoundedImage(assetPath: place.imageAsset, height: AppSizes.heroImageHeight),
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: FavoriteButton(isFavorite: place.isFavorite, onPressed: onFavoriteTap ?? () {}),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        Text(place.name, style: AppTextStyles.headingSmall),
        SizedBox(height: 2.h),
        Text(place.subtitle, style: AppTextStyles.bodyMedium),
        SizedBox(height: 4.h),
        Row(
          children: [
            RatingWidget(rating: place.rating, reviewCount: place.reviewCount),
            SizedBox(width: AppSpacing.sm),
            Text('•', style: AppTextStyles.caption),
            SizedBox(width: AppSpacing.sm),
            Text(place.durationLabel, style: AppTextStyles.caption),
          ],
        ),
      ],
    );
  }

  Widget _buildList() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.cardRadius,
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          RoundedImage(
            assetPath: place.imageAsset,
            height: AppSizes.placeCardImageHeight * 0.64,
            width: AppSizes.placeCardImageHeight * 0.64,
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.name, style: AppTextStyles.headingSmall),
                SizedBox(height: 2.h),
                Text(place.subtitle, style: AppTextStyles.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    RatingWidget(rating: place.rating, compact: true),
                    SizedBox(width: AppSpacing.sm),
                    Text(place.durationLabel, style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
          FavoriteButton(isFavorite: place.isFavorite, onPressed: onFavoriteTap ?? () {}),
        ],
      ),
    );
  }
}
