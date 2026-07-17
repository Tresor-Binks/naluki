import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran Explorer (catégories : Restaurants, Hôtels, Bars, Activités).
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Explorer',
      subtitle: 'Recherchez un lieu, une activité',
      actions: [
        SkeletonAction(
          label: 'Rechercher',
          onPressed: () => context.pushNamed(RouteNames.search),
        ),
        SkeletonAction(
          label: 'Filtres',
          onPressed: () => context.pushNamed(RouteNames.filters),
        ),
        SkeletonAction(
          label: 'Parcours & expériences',
          onPressed: () => context.pushNamed(RouteNames.itineraries),
        ),
        SkeletonAction(
          label: 'Voir un lieu',
          onPressed: () => context.pushNamed(
            RouteNames.placeDetail,
            pathParameters: {'placeId': 'chill-restaurant'},
          ),
        ),
      ],
    );
  }
}
