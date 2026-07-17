import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_page.dart';

/// Écran vidéo immersive d'un lieu (route `/video/:placeId`).
class VideoPage extends StatelessWidget {
  const VideoPage({required this.placeId, super.key});

  final String placeId;

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Vidéo lieu',
      subtitle: 'Ambiance du soir 🌙 — $placeId',
      showBackButton: true,
    );
  }
}
