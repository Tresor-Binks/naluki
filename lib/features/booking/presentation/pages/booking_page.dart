import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran "Réserver une table" (route `/booking/:placeId`).
class BookingPage extends StatelessWidget {
  const BookingPage({required this.placeId, super.key});

  final String placeId;

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Réservation',
      subtitle: 'Réserver une table — $placeId',
      showBackButton: true,
      actions: [
        SkeletonAction(
          label: 'Continuer (→ Paiement)',
          onPressed: () => context.pushNamed(RouteNames.payment),
        ),
      ],
    );
  }
}
