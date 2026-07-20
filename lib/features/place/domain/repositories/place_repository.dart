import '../models/place_model.dart';

/// Contrat d'accès aux données de lieux.
///
/// Phase 2 : implémentée par [LocalPlaceRepository] (données en mémoire).
/// Phase 3/4 (Backend/API) : une nouvelle implémentation (ex.
/// `ApiPlaceRepository`) remplacera `LocalPlaceRepository` sans qu'aucun
/// widget n'ait besoin de changer — seul le provider sera réassigné.
abstract interface class PlaceRepository {
  Future<List<PlaceModel>> getAll();
  Future<PlaceModel> getById(String id);
}
