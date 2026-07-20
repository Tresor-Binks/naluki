import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local_place_repository.dart';
import '../../domain/models/place_model.dart';
import '../../domain/repositories/place_repository.dart';
import 'favorites_controller.dart';

/// Fournit l'implémentation courante de [PlaceRepository].
///
/// Pour brancher une future API : remplacer uniquement cette ligne par
/// `ApiPlaceRepository(...)` — aucun autre fichier n'a besoin de changer.
final placeRepositoryProvider = Provider<PlaceRepository>((ref) => LocalPlaceRepository());

/// Liste brute des lieux (sans état favori — c'est un détail du repository).
final _rawPlacesProvider = FutureProvider<List<PlaceModel>>((ref) {
  return ref.watch(placeRepositoryProvider).getAll();
});

/// Liste des lieux avec l'état `isFavorite` fusionné depuis
/// [favoritesControllerProvider]. C'est CETTE provider que les pages doivent
/// utiliser (jamais `_rawPlacesProvider` directement).
final placesProvider = Provider<AsyncValue<List<PlaceModel>>>((ref) {
  final favorites = ref.watch(favoritesControllerProvider);
  final raw = ref.watch(_rawPlacesProvider);
  return raw.whenData((places) => places.map((p) => p.copyWith(isFavorite: favorites.contains(p.id))).toList());
});

/// Un lieu précis par id, favori inclus. Retourne `null` tant que les
/// données ne sont pas chargées ou si l'id est introuvable.
final placeByIdProvider = Provider.family<PlaceModel?, String>((ref, id) {
  final places = ref.watch(placesProvider).valueOrNull;
  if (places == null) return null;
  for (final place in places) {
    if (place.id == id) return place;
  }
  return null;
});
