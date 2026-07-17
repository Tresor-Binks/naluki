import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran Carte (localisation des lieux autour de l'utilisateur).
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Carte',
      subtitle: 'Lieux à proximité',
      showBackButton: true,
    );
  }
}
