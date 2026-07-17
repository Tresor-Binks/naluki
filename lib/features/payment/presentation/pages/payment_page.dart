import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran de paiement (route `/payment`).
class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Paiement',
      subtitle: 'Airtel Money, MTN Mobile Money, Carte bancaire, Espèces',
      showBackButton: true,
      actions: [
        SkeletonAction(
          label: 'Payer (→ Réservations)',
          onPressed: () => context.goNamed(RouteNames.bookings),
        ),
      ],
    );
  }
}
