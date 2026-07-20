import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../../core/widgets/place_card.dart';
import '../../../place/presentation/controllers/favorites_controller.dart';
import '../../../place/presentation/controllers/place_providers.dart';

/// Écran Explorer — recherche, catégories (Tous/Restaurants/Hôtels/Bars),
/// filtres, liste des lieux. Reproduction fidèle de la maquette.
class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  static const _categories = ['Tous', 'Restaurants', 'Hôtels', 'Bars'];
  String _selectedCategory = 'Tous';

  @override
  Widget build(BuildContext context) {
    final placesAsync = ref.watch(placesProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchBar(
                          hintText: 'Rechercher',
                          onTap: () => context.pushNamed(RouteNames.search),
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      GestureDetector(
                        onTap: () => context.pushNamed(RouteNames.filters),
                        child: Container(
                          width: 48.h,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Icon(AppIcons.filter, color: AppColors.textOnPrimary, size: 20.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        return AppFilterChip(
                          label: category,
                          selected: category == _selectedCategory,
                          onTap: () => setState(() => _selectedCategory = category),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: placesAsync.when(
                loading: () => const LoadingWidget(),
                error: (error, stack) => AppErrorWidget(
                  message: 'Impossible de charger les lieux.',
                  onRetry: () => ref.invalidate(placesProvider),
                ),
                data: (places) {
                  final filtered = _selectedCategory == 'Tous'
                      ? places
                      : places.where((p) => p.category == _selectedCategory).toList();

                  if (filtered.isEmpty) {
                    return const EmptyStateWidget(
                      icon: Icons.search_off_rounded,
                      title: 'Aucun lieu dans cette catégorie',
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.md),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) {
                      final place = filtered[index];
                      return PlaceCard(
                        place: place,
                        onTap: () => context.pushNamed(
                          RouteNames.placeDetail,
                          pathParameters: {'placeId': place.id},
                        ),
                        onFavoriteTap: () => ref.read(favoritesControllerProvider.notifier).toggle(place.id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
