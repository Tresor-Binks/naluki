import 'package:flutter/material.dart';

import 'app_durations.dart';

/// Courbes et transitions réutilisables de Naluki.
///
/// Ces helpers seront branchés sur GoRouter à l'étape "Navigation"
/// (transitions de page) et utilisés localement pour les micro-animations
/// (fade, scale, slide) sur les widgets.
abstract final class AppAnimations {
  static const Curve curve = Curves.easeInOutCubic;
  static const Curve curveEmphasized = Curves.easeOutBack;

  /// Transition en fondu (fade), pour les changements d'onglet par exemple.
  static Widget fade({required Animation<double> animation, required Widget child}) {
    return FadeTransition(opacity: CurvedAnimation(parent: animation, curve: curve), child: child);
  }

  /// Transition en zoom léger (scale), pour l'apparition de cartes/modales.
  static Widget scale({required Animation<double> animation, required Widget child}) {
    final curved = CurvedAnimation(parent: animation, curve: curveEmphasized);
    return ScaleTransition(
      scale: Tween<double>(begin: 0.92, end: 1).animate(curved),
      child: FadeTransition(opacity: curved, child: child),
    );
  }

  /// Transition de glissement horizontal (slide), pour la navigation de page.
  static Widget slideHorizontal({required Animation<double> animation, required Widget child}) {
    final curved = CurvedAnimation(parent: animation, curve: curve);
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(curved),
      child: child,
    );
  }

  /// Transition de glissement vertical (slide up), pour les bottom sheets/modales.
  static Widget slideUp({required Animation<double> animation, required Widget child}) {
    final curved = CurvedAnimation(parent: animation, curve: curve);
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(curved),
      child: child,
    );
  }

  /// Durée par défaut à utiliser avec ces transitions de page.
  static const Duration pageTransitionDuration = AppDurations.pageTransition;
}
