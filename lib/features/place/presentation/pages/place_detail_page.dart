import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran de détail d'un lieu (route `/place/:placeId`).
class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({required this.placeId, super.key});

  final String placeId;

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Détail lieu',
      subtitle: 'Lieu : $placeId',
      showBackButton: true,
      actions: [
        SkeletonAction(
          label: 'Voir la vidéo du lieu',
          onPressed: () => context.pushNamed(
            RouteNames.video,
            pathParameters: {'placeId': placeId},
          ),
        ),
        SkeletonAction(
          label: 'Réserver une table',
          onPressed: () => context.pushNamed(
            RouteNames.booking,
            pathParameters: {'placeId': placeId},
          ),
        ),
      ],
    );
  }
}
