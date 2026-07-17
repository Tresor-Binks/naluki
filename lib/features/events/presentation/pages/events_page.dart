import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran Événements ("À venir", "Aujourd'hui", "Ce week-end").
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonPage(
      title: 'Événements',
      subtitle: 'Concerts, festivals, expositions près de vous',
      showBackButton: true,
    );
  }
}
