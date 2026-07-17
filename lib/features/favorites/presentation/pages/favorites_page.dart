import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran "Mes favoris" (accessible depuis le Profil).
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Favoris',
      subtitle: 'Lieux, Parcours, Événements enregistrés',
      showBackButton: true,
    );
  }
}
