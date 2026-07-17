import 'package:flutter/material.dart';

/// Palette de couleurs officielle de Naluki.
///
/// ⚠️ Ne jamais coder une couleur en dur ailleurs dans l'app : toujours
/// passer par [AppColors]. Les valeurs ci-dessous ont été extraites par
/// échantillonnage pixel direct de la maquette (logo, boutons CTA, textes).
abstract final class AppColors {
  // ---------------------------------------------------------------------
  // Marque
  // ---------------------------------------------------------------------

  /// Vert Naluki — logo, boutons primaires, éléments actifs.
  static const Color primary = Color(0xFF0E6B34);

  /// Vert foncé — état pressé / hover du bouton primaire.
  static const Color primaryDark = Color(0xFF0B4D26);

  /// Vert clair — fonds teintés (badges, sélections légères).
  static const Color primaryLight = Color(0xFFE3F1E7);

  /// Orange Naluki — tagline "Find your place", anneau du logo, promotions.
  static const Color accent = Color(0xFFF59E0B);

  /// Orange foncé — état pressé des éléments accent.
  static const Color accentDark = Color(0xFFD97F06);

  /// Orange clair — fonds teintés (badges promo, highlights).
  static const Color accentLight = Color(0xFFFEF0D9);

  // ---------------------------------------------------------------------
  // Fond & surfaces
  // ---------------------------------------------------------------------

  /// Fond de page — blanc pur. Utilisé par `scaffoldBackgroundColor`.
  static const Color background = Color(0xFFFFFFFF);

  /// Surface des cartes et bottom sheets — blanc (identique à [background],
  /// distinguée visuellement par une bordure/ombre, pas par la couleur).
  static const Color surface = Color(0xFFFFFFFF);

  /// Fond gris clair des CHAMPS DE FORMULAIRE (TextField), chips, et
  /// séparateurs de section. Ne jamais utiliser [surface] (blanc) pour un
  /// champ de saisie : c'est cette couleur-ci qui doit s'afficher grisée.
  static const Color surfaceMuted = Color(0xFFF0F1F3);

  /// Bordures fines (cartes, champs, séparateurs).
  static const Color border = Color(0xFFE3E5E8);

  // ---------------------------------------------------------------------
  // Texte
  // ---------------------------------------------------------------------

  /// Texte principal (titres, contenu important) — noir chaud.
  static const Color textPrimary = Color(0xFF221A12);

  /// Texte secondaire (sous-titres, descriptions).
  static const Color textSecondary = Color(0xFF6F6B63);

  /// Texte tertiaire (placeholders, métadonnées discrètes).
  static const Color textTertiary = Color(0xFFA6A199);

  /// Texte sur fond coloré (boutons primaires, badges pleins).
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------
  // États sémantiques
  // ---------------------------------------------------------------------

  /// Succès / disponibilité ("Ouvert", "Confirmée", "Active").
  static const Color success = Color(0xFF1AA35C);
  static const Color successLight = Color(0xFFE1F5EA);

  /// Attention / en attente ("En attente").
  static const Color warning = Color(0xFFF5A623);
  static const Color warningLight = Color(0xFFFCF1DA);

  /// Erreur / annulation ("Annulée").
  static const Color error = Color(0xFFE0503B);
  static const Color errorLight = Color(0xFFFBE7E3);

  /// Information (badges neutres, liens).
  static const Color info = Color(0xFF3B82C4);

  // ---------------------------------------------------------------------
  // Notation & favoris
  // ---------------------------------------------------------------------

  /// Couleur des étoiles de notation.
  static const Color rating = Color(0xFFF5A623);

  /// Cœur / favori actif.
  static const Color favorite = Color(0xFFE0503B);

  // ---------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------

  /// Icône / label actif de la bottom navigation.
  static const Color navActive = primary;

  /// Icône / label inactif de la bottom navigation.
  static const Color navInactive = Color(0xFFB7B2A9);

  // ---------------------------------------------------------------------
  // Overlay & divers
  // ---------------------------------------------------------------------

  /// Voile sombre sur images (vidéos, hero, carrousels).
  static const Color overlayDark = Color(0x99000000);

  /// Icônes/texte sur fond sombre (vidéos, hero).
  static const Color onDark = Color(0xFFFFFFFF);

  /// Ombre générique (voir aussi [AppShadows]).
  static const Color shadow = Color(0x1A000000);
}
