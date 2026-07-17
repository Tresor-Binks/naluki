import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

/// Ombres officielles de Naluki.
///
/// La maquette utilise des ombres douces et discrètes sous les cartes,
/// boutons flottants et barres de navigation.
abstract final class AppShadows {
  /// Ombre très légère (chips, petits éléments).
  static List<BoxShadow> get soft => [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  /// Ombre standard (cartes restaurants/événements).
  static List<BoxShadow> get card => [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  /// Ombre marquée (bottom navigation, bottom sheets, boutons flottants).
  static List<BoxShadow> get elevated => [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];
}
