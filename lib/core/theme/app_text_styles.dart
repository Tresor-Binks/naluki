import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

/// Échelle typographique officielle de Naluki.
///
/// Police : **Poppins** (Google Fonts), la plus proche de la maquette
/// (géométrique, arrondie, moderne). Cette hypothèse pourra être ajustée
/// si une autre police est précisée.
///
/// Toutes les tailles utilisent `.sp` (flutter_screenutil) pour rester
/// responsive sur tous les écrans.
abstract final class AppTextStyles {
  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = AppColors.textPrimary,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ---------------------------------------------------------------------
  // Titres
  // ---------------------------------------------------------------------

  /// Très grand titre — écran de bienvenue / splash ("Découvrez.").
  static TextStyle get displayLarge => _base(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  /// Titre de page ("Bienvenue 👋", "Paiement").
  static TextStyle get headingLarge => _base(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
      );

  /// Titre de section ("Recommandé pour vous", "Catégories populaires").
  static TextStyle get headingMedium => _base(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  /// Petit titre (titre de carte, ex. "Le Chill Restaurant").
  static TextStyle get headingSmall => _base(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  // ---------------------------------------------------------------------
  // Corps de texte
  // ---------------------------------------------------------------------

  /// Corps de texte standard.
  static TextStyle get bodyLarge => _base(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.4,
      );

  /// Corps de texte par défaut (descriptions, listes).
  static TextStyle get bodyMedium => _base(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  /// Petit corps de texte (métadonnées, distance, horaires).
  static TextStyle get bodySmall => _base(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  // ---------------------------------------------------------------------
  // Libellés & boutons
  // ---------------------------------------------------------------------

  /// Texte des boutons primaires/secondaires.
  static TextStyle get button => _base(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      );

  /// Libellé (labels de champs, chips, tags).
  static TextStyle get label => _base(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );

  /// Très petit libellé (badges, bottom nav, tagline).
  static TextStyle get caption => _base(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textTertiary,
      );

  /// Tagline stylée type "FIND YOUR PLACE" (espacée, majuscules).
  static TextStyle get overline => _base(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
        letterSpacing: 2,
      );

  /// Montants / prix mis en avant ("0 FCFA", "-20%").
  static TextStyle get priceLarge => _base(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
}
