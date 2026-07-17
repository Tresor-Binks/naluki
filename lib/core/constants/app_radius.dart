import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Rayons de bordure officiels de Naluki.
///
/// La maquette utilise des coins très arrondis (cartes, boutons, champs,
/// badges) : cette échelle centralise toutes les valeurs.
abstract final class AppRadius {
  static double get xs => 6.r;
  static double get sm => 10.r;
  static double get md => 14.r;
  static double get lg => 18.r;
  static double get xl => 24.r;

  /// Boutons pleine largeur (très arrondis, façon pilule).
  static double get button => 16.r;

  /// Cartes (restaurants, événements, promotions).
  static double get card => 18.r;

  /// Champs de saisie.
  static double get input => 14.r;

  /// Éléments totalement circulaires (avatars, FAB, chips ronds).
  static double get full => 999.r;

  // Helpers prêts à l'emploi -------------------------------------------------

  static BorderRadius get buttonRadius => BorderRadius.circular(button);
  static BorderRadius get cardRadius => BorderRadius.circular(card);
  static BorderRadius get inputRadius => BorderRadius.circular(input);
  static BorderRadius get fullRadius => BorderRadius.circular(full);
}
