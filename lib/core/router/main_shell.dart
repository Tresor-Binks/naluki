import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_bottom_navigation.dart';
import 'route_names.dart';

/// Enveloppe (shell) des 4 onglets principaux de l'app.
///
/// Utilise [StatefulNavigationShell] de GoRouter : chaque onglet conserve
/// sa propre pile de navigation, et l'état actif de la [CustomBottomNavigation]
/// suit automatiquement la branche courante.
class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: (index) => navigationShell.goBranch(
          index,
          // Revenir à la racine de l'onglet s'il est déjà actif.
          initialLocation: index == navigationShell.currentIndex,
        ),
        onQuickAction: () => context.pushNamed(RouteNames.search),
      ),
    );
  }
}
