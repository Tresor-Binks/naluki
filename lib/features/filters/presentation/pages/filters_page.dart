import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran Filtres (catégories, distance, prix, note minimale).
class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Filtres',
      subtitle: 'Catégories, distance, prix, note minimale',
      showBackButton: true,
    );
  }
}
