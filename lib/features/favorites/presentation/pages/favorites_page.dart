import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../../core/widgets/place_card.dart';
import '../../../place/presentation/controllers/favorites_controller.dart';
import '../../../place/presentation/controllers/place_providers.dart';

/// Écran "Mes favoris" (accessible depuis le Profil).
class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  static const _tabs = ['Lieux', 'Parcours', 'Événements'];
  String _selected = 'Lieux';

  @override
  Widget build(BuildContext context) {
    final placesAsync = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Mes favoris'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              scrollDirection: Axis.horizontal,
              itemCount: _tabs.length,
              separatorBuilder: (_, __) => SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) => AppFilterChip(
                label: _tabs[index],
                selected: _tabs[index] == _selected,
                onTap: () => setState(() => _selected = _tabs[index]),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.md),
          Expanded(
            child: _selected != 'Lieux'
                ? const EmptyStateWidget(
                    icon: Icons.bookmark_border_rounded,
                    title: 'Rien ici pour l’instant',
                    subtitle: 'Vos favoris apparaîtront ici.',
                  )
                : placesAsync.when(
                    loading: () => const LoadingWidget(),
                    error: (error, stack) => AppErrorWidget(
                      message: 'Impossible de charger les favoris.',
                      onRetry: () => ref.invalidate(placesProvider),
                    ),
                    data: (places) {
                      final favorites = places.where((p) => p.isFavorite).toList();

                      if (favorites.isEmpty) {
                        return const EmptyStateWidget(
                          icon: Icons.bookmark_border_rounded,
                          title: 'Aucun favori pour l’instant',
                          subtitle: 'Appuyez sur ♡ sur un lieu pour l’ajouter ici.',
                        );
                      }

                      return ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.sm),
                        itemCount: favorites.length,
                        separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                        itemBuilder: (context, index) {
                          final place = favorites[index];
                          return PlaceCard(
                            place: place,
                            onTap: () =>
                                context.pushNamed(RouteNames.placeDetail, pathParameters: {'placeId': place.id}),
                            onFavoriteTap: () =>
                                ref.read(favoritesControllerProvider.notifier).toggle(place.id),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
