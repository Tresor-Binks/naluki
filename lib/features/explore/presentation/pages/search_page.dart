import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/place_card.dart';
import '../../../place/domain/models/place_model.dart';
import '../../../place/presentation/controllers/place_providers.dart';

/// Écran de recherche (ouvert depuis Explorer ou le bouton central "+").
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final allPlaces = ref.watch(placesProvider).valueOrNull ?? const <PlaceModel>[];
    final results = _query.isEmpty
        ? const <PlaceModel>[]
        : allPlaces.where((p) => p.name.toLowerCase().contains(_query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(
                hintText: 'Rechercher un lieu, une activité...',
                onChanged: (value) => setState(() => _query = value),
              ),
              SizedBox(height: AppSpacing.xxl),
              if (_query.isEmpty) ...[
                Text('Recherches récentes', style: AppTextStyles.label),
                SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: const [
                    _RecentChip('Restaurants'),
                    _RecentChip('Bacongo'),
                    _RecentChip('Bars'),
                    _RecentChip('Le Chill Restaurant'),
                  ],
                ),
              ] else if (results.isEmpty) ...[
                const EmptyStateWidget(
                  icon: Icons.search_off_rounded,
                  title: 'Aucun résultat',
                  subtitle: 'Essayez un autre mot-clé.',
                ),
              ] else
                Expanded(
                  child: ListView.separated(
                    itemCount: results.length,
                    separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) {
                      final place = results[index];
                      return PlaceCard(
                        place: place,
                        onTap: () =>
                            context.pushNamed(RouteNames.placeDetail, pathParameters: {'placeId': place.id}),
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

class _RecentChip extends StatelessWidget {
  const _RecentChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: AppTextStyles.label.copyWith(color: AppColors.textSecondary)),
    );
  }
}
