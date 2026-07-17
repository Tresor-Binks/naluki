import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran de recherche (ouvert depuis Explorer ou le bouton central "+").
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Rechercher',
      subtitle: 'Rechercher un lieu, une activité...',
      showBackButton: true,
    );
  }
}
