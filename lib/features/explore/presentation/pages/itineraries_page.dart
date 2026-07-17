import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran Parcours & Expériences ("Food Tour", "Culture & Histoire"...).
class ItinerariesPage extends StatelessWidget {
  const ItinerariesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Parcours & Expériences',
      subtitle: 'Food Tour, Culture & Histoire, Détente & Nature...',
      showBackButton: true,
    );
  }
}
