import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';

/// Items de la Bottom Navigation du back-office admin (écran 21).
const List<NavItemData> adminNavItems = [
  NavItemData(icon: AppIcons.dashboard, label: 'Dashboard'),
  NavItemData(icon: Icons.people_alt_rounded, label: 'Utilisateurs'),
  NavItemData(icon: AppIcons.location, label: 'Lieux'),
  NavItemData(icon: Icons.article_rounded, label: 'Contenu'),
  NavItemData(icon: AppIcons.settings, label: 'Paramètres'),
];

/// Gère la navigation entre les onglets du back-office admin.
/// "Dashboard" → statistiques globales, "Lieux" → modération. Les autres
/// onglets (Utilisateurs, Contenu, Paramètres) n'ont pas d'écran dédié dans
/// la maquette fournie : ils restent sur la page courante pour l'instant.
void onAdminNavTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.goNamed(RouteNames.adminStats);
    case 2:
      context.goNamed(RouteNames.adminModeration);
    default:
      break;
  }
}
