import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Centralisation des icônes officielles de Naluki.
///
/// Toutes les icônes de l'app doivent être référencées ici plutôt que
/// codées en dur dans les widgets — permet de changer facilement une icône
/// (ou de la remplacer par un SVG custom) sans toucher aux pages.
abstract final class AppIcons {
  // Navigation principale (Bottom Navigation) --------------------------
  static const IconData home = CupertinoIcons.house_fill;
  static const IconData explore = CupertinoIcons.compass_fill;
  static const IconData bookings = CupertinoIcons.calendar;
  static const IconData favorites = CupertinoIcons.heart_fill;
  static const IconData profile = CupertinoIcons.person_fill;

  // Actions génériques ----------------------------------------------------
  static const IconData back = CupertinoIcons.back;
  static const IconData close = CupertinoIcons.xmark;
  static const IconData search = CupertinoIcons.search;
  static const IconData filter = CupertinoIcons.slider_horizontal_3;
  static const IconData notification = CupertinoIcons.bell;
  static const IconData share = CupertinoIcons.share;
  static const IconData add = CupertinoIcons.add;
  static const IconData edit = CupertinoIcons.pencil;
  static const IconData chevronRight = CupertinoIcons.chevron_right;
  static const IconData chevronDown = CupertinoIcons.chevron_down;

  // Lieux / réservation -------------------------------------------------
  static const IconData location = CupertinoIcons.location_solid;
  static const IconData clock = CupertinoIcons.clock;
  static const IconData star = CupertinoIcons.star_fill;
  static const IconData heart = CupertinoIcons.heart;
  static const IconData heartFilled = CupertinoIcons.heart_fill;
  static const IconData table = Icons.table_restaurant_rounded;
  static const IconData person = CupertinoIcons.person;
  static const IconData wifi = CupertinoIcons.wifi;
  static const IconData parking = Icons.local_parking_rounded;
  static const IconData terrace = Icons.deck_rounded;
  static const IconData music = CupertinoIcons.music_note;

  // Paiement --------------------------------------------------------------
  static const IconData payment = CupertinoIcons.creditcard;
  static const IconData mobileMoney = CupertinoIcons.phone_fill;
  static const IconData cash = CupertinoIcons.money_dollar;

  // Carte / vidéo / médias -------------------------------------------------
  static const IconData map = CupertinoIcons.map_fill;
  static const IconData play = CupertinoIcons.play_fill;
  static const IconData comment = CupertinoIcons.chat_bubble;
  static const IconData camera = CupertinoIcons.camera_fill;

  // Compte / paramètres ------------------------------------------------
  static const IconData settings = CupertinoIcons.settings;
  static const IconData help = CupertinoIcons.question_circle;
  static const IconData logout = CupertinoIcons.square_arrow_right;
  static const IconData download = CupertinoIcons.arrow_down_circle;

  // Professionnel / admin ---------------------------------------------
  static const IconData dashboard = CupertinoIcons.chart_bar_alt_fill;
  static const IconData promotions = CupertinoIcons.tag_fill;
  static const IconData reviews = CupertinoIcons.star_circle_fill;
  static const IconData moderation = CupertinoIcons.checkmark_shield_fill;
}
