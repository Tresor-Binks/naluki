import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/skeleton_page.dart';

/// Écran Profil ("Jean Moukoko", menu de compte).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      title: 'Profil',
      subtitle: 'Jean Moukoko',
      actions: [
        SkeletonAction(
          label: 'Mes favoris',
          onPressed: () => context.pushNamed(RouteNames.favorites),
        ),
        SkeletonAction(
          label: 'Design System (debug)',
          onPressed: () => context.pushNamed(RouteNames.designSystem),
        ),
      ],
    );
  }
}
