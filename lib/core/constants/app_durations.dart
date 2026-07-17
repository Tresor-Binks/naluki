/// Durées d'animation officielles de Naluki.
///
/// Centralise toutes les durées pour garder des transitions cohérentes
/// (fade, scale, slide, hero, ripple, bottom navigation).
abstract final class AppDurations {
  /// Micro-interactions (ripple, changement d'état d'un chip/bouton).
  static const Duration fast = Duration(milliseconds: 150);

  /// Transitions standard (fade, scale, changement d'onglet).
  static const Duration medium = Duration(milliseconds: 300);

  /// Transitions de page (push/pop navigation).
  static const Duration pageTransition = Duration(milliseconds: 350);

  /// Animations plus marquées (hero, bottom sheet).
  static const Duration slow = Duration(milliseconds: 500);

  /// Splash / animations d'introduction.
  static const Duration splash = Duration(milliseconds: 800);
}
