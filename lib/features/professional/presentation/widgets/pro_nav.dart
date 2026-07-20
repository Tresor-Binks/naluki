import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';

/// Items de la Bottom Navigation de l'espace professionnel (écran 15).
const List<NavItemData> proNavItems = [
  NavItemData(icon: AppIcons.home, label: 'Accueil'),
  NavItemData(icon: AppIcons.reviews, label: 'Avis'),
  NavItemData(icon: AppIcons.bookings, label: 'Réservations'),
  NavItemData(icon: AppIcons.dashboard, label: 'Statistiques'),
  NavItemData(icon: Icons.more_horiz_rounded, label: 'Plus'),
];

/// Gère la navigation entre les onglets de l'espace professionnel.
/// "Accueil" et "Statistiques" pointent tous deux vers le tableau de bord
/// (qui contient déjà les statistiques) — pas de page dupliquée.
void onProNavTap(BuildContext context, int index) {
  switch (index) {
    case 0:
    case 3:
      context.goNamed(RouteNames.proDashboard);
    case 1:
      context.goNamed(RouteNames.proReviews);
    case 2:
      context.goNamed(RouteNames.proBookings);
    case 4:
      context.goNamed(RouteNames.proListing);
  }
}
