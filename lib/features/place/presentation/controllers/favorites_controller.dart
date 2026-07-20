import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Gère l'ensemble des identifiants de lieux mis en favori.
///
/// Phase 2 : état en mémoire (perdu à la fermeture de l'app). Phase 3+ :
/// persistance locale (Hive/SharedPreferences) ou synchronisation serveur —
/// aucun widget consommateur n'aura à changer, seule cette classe évoluera.
class FavoritesController extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  bool isFavorite(String placeId) => state.contains(placeId);

  void toggle(String placeId) {
    final next = {...state};
    if (!next.remove(placeId)) next.add(placeId);
    state = next;
  }
}

final favoritesControllerProvider = NotifierProvider<FavoritesController, Set<String>>(
  FavoritesController.new,
);
