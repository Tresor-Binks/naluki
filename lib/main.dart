import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Point d'entrée de l'application Naluki.
///
/// Phase 1 - Étape "Structure" :
/// - ProviderScope (Riverpod) déjà en place pour les phases suivantes.
/// - Aucun thème, aucune route, aucune page pour le moment.
void main() {
  runApp(const ProviderScope(child: NalukiApp()));
}
