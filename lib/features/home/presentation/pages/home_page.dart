import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/category_card.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../../core/widgets/place_card.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../place/presentation/controllers/favorites_controller.dart';
import '../../../place/presentation/controllers/place_providers.dart';
import '../widgets/itinerary_preview_card.dart';

/// Écran d'accueil — header ville, recherche, recommandations, catégories,
/// parcours populaires. Reproduction fidèle de la maquette.
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesAsync = ref.watch(placesProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header : ville + notifications
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('Brazzaville', style: AppTextStyles.headingMedium),
                        Icon(AppIcons.chevronDown, size: 18.sp, color: AppColors.textPrimary),
                      ],
                    ),
                  ),
                  Icon(AppIcons.notification, color: AppColors.textPrimary, size: 22.sp),
                ],
              ),
              SizedBox(height: AppSpacing.lg),

              CustomSearchBar(
                hintText: 'Rechercher un lieu, une activité...',
                onTap: () => context.pushNamed(RouteNames.search),
              ),
              SizedBox(height: AppSpacing.xxl),

              placesAsync.when(
                loading: () => const LoadingWidget(),
                error: (error, stack) => AppErrorWidget(
                  message: 'Impossible de charger les lieux.',
                  onRetry: () => ref.invalidate(placesProvider),
                ),
                data: (places) {
                  if (places.isEmpty) {
                    return const EmptyStateWidget(icon: Icons.place_outlined, title: 'Aucun lieu pour l’instant');
                  }
                  final recommended = places.first;
                  final others = places.skip(1).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: 'Recommandé pour vous', actionLabel: 'Voir tout', onActionTap: () {}),
                      SizedBox(height: AppSpacing.md),
                      PlaceCard(
                        place: recommended,
                        variant: PlaceCardVariant.hero,
                        onTap: () => context.pushNamed(
                          RouteNames.placeDetail,
                          pathParameters: {'placeId': recommended.id},
                        ),
                        onFavoriteTap: () =>
                            ref.read(favoritesControllerProvider.notifier).toggle(recommended.id),
                      ),
                      SizedBox(height: AppSpacing.xxl),

                      SectionTitle(title: 'Catégories populaires', actionLabel: 'Voir tout', onActionTap: () {}),
                      SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 90.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoryCard(icon: Icons.restaurant_rounded, label: 'Restaurants', onTap: () {}),
                            SizedBox(width: AppSpacing.lg),
                            CategoryCard(icon: Icons.hotel_rounded, label: 'Hôtels', onTap: () {}),
                            SizedBox(width: AppSpacing.lg),
                            CategoryCard(icon: Icons.local_activity_rounded, label: 'Activités', onTap: () {}),
                            SizedBox(width: AppSpacing.lg),
                            CategoryCard(icon: Icons.local_bar_rounded, label: 'Bars', onTap: () {}),
                            SizedBox(width: AppSpacing.lg),
                            CategoryCard(icon: Icons.apps_rounded, label: 'Plus', onTap: () {}),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.xxl),

                      SectionTitle(
                        title: 'Parcours populaires',
                        actionLabel: 'Voir tout',
                        onActionTap: () => context.pushNamed(RouteNames.itineraries),
                      ),
                      SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 130.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ItineraryPreviewCard(
                              title: 'Food Tour',
                              subtitle: 'Les meilleurs restos',
                              count: '8 lieux',
                              onTap: () => context.pushNamed(RouteNames.itineraries),
                            ),
                            SizedBox(width: AppSpacing.md),
                            ItineraryPreviewCard(
                              title: 'Culture & Histoire',
                              subtitle: 'Musées et sites',
                              count: '6 parcours',
                              onTap: () => context.pushNamed(RouteNames.itineraries),
                            ),
                            SizedBox(width: AppSpacing.md),
                            ItineraryPreviewCard(
                              title: 'Détente & Nature',
                              subtitle: 'Parcs et plages',
                              count: '4 parcours',
                              onTap: () => context.pushNamed(RouteNames.itineraries),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),

                      // Autres lieux recommandés (liste compacte)
                      ...others.map(
                        (place) => Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.md),
                          child: PlaceCard(
                            place: place,
                            onTap: () => context.pushNamed(
                              RouteNames.placeDetail,
                              pathParameters: {'placeId': place.id},
                            ),
                            onFavoriteTap: () =>
                                ref.read(favoritesControllerProvider.notifier).toggle(place.id),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

