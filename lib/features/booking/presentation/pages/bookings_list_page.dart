import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran "Mes réservations" (onglet Bottom Navigation).
class BookingsListPage extends StatelessWidget {
  const BookingsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Réservations',
      subtitle: 'Vos réservations à venir et passées',
    );
  }
}
