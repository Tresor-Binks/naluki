import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tailles standardisées de Naluki (icônes, boutons, avatars, images).
abstract final class AppSizes {
  // Icônes ------------------------------------------------------------------
  static double get iconXs => 14.sp;
  static double get iconSm => 18.sp;
  static double get iconMd => 22.sp;
  static double get iconLg => 28.sp;
  static double get iconXl => 36.sp;

  // Boutons -------------------------------------------------------------
  static double get buttonHeight => 52.h;
  static double get buttonHeightSmall => 40.h;

  // Champs de saisie ------------------------------------------------------
  static double get inputHeight => 52.h;

  // Avatars -----------------------------------------------------------------
  static double get avatarSm => 32.r;
  static double get avatarMd => 48.r;
  static double get avatarLg => 72.r;
  static double get avatarXl => 96.r;

  // Cartes / vignettes ------------------------------------------------------
  static double get placeCardImageHeight => 100.h;
  static double get categoryCardSize => 64.w;
  static double get heroImageHeight => 220.h;

  // Bottom navigation ---------------------------------------------------
  static double get bottomNavHeight => 64.h;

  // Rayon des points d'événements/carte --------------------------------
  static double get mapPinSize => 32.w;
}
