import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran d'accueil ("Brazzaville ▾", recommandations, catégories, parcours).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Accueil',
      subtitle: 'Brazzaville — Recommandé pour vous',
      actions: [
        SkeletonAction(
          label: 'Voir un lieu',
          onPressed: () => context.pushNamed(
            RouteNames.placeDetail,
            pathParameters: {'placeId': 'chill-restaurant'},
          ),
        ),
        SkeletonAction(
          label: 'Voir les événements',
          onPressed: () => context.pushNamed(RouteNames.events),
        ),
        SkeletonAction(
          label: 'Voir la carte',
          onPressed: () => context.pushNamed(RouteNames.map),
        ),
      ],
    );
  }
}
