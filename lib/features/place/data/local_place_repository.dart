import '../domain/models/place_model.dart';
import '../domain/repositories/place_repository.dart';

/// Implémentation locale (en mémoire) de [PlaceRepository].
///
/// Les données ci-dessous reprennent les exemples de la maquette. Le
/// `isFavorite` de [PlaceModel] n'est PAS géré ici : c'est
/// [FavoritesController] (Riverpod) qui porte cet état, combiné à la volée
/// avec ces lieux — voir `place_providers.dart`.
class LocalPlaceRepository implements PlaceRepository {
  static const List<PlaceModel> _seed = [
    PlaceModel(
      id: 'chill-restaurant',
      name: 'Le Chill Restaurant',
      category: 'Restaurants',
      type: 'Cuisine africaine',
      area: 'Bacongo',
      rating: 4.6,
      reviewCount: 128,
      durationMinutesMin: 15,
      durationMinutesMax: 25,
    ),
    PlaceModel(
      id: 'chez-anto',
      name: 'Chez Anto',
      category: 'Restaurants',
      type: 'Restaurant',
      area: 'Poto-Poto',
      rating: 4.2,
      reviewCount: 86,
      durationMinutesMin: 20,
      durationMinutesMax: 30,
    ),
    PlaceModel(
      id: 'ma-terrasse',
      name: 'Ma Terrasse',
      category: 'Restaurants',
      type: 'Restaurant',
      area: 'Centre-ville',
      rating: 4.5,
      reviewCount: 64,
      durationMinutesMin: 10,
      durationMinutesMax: 15,
    ),
    PlaceModel(
      id: 'lounge-242',
      name: 'Lounge 242',
      category: 'Bars',
      type: 'Bar lounge',
      area: 'Ouenzé',
      rating: 4.3,
      reviewCount: 91,
      durationMinutesMin: 15,
      durationMinutesMax: 20,
    ),
  ];

  @override
  Future<List<PlaceModel>> getAll() async => _seed;

  @override
  Future<PlaceModel> getById(String id) async {
    return _seed.firstWhere((p) => p.id == id, orElse: () => _seed.first);
  }
}
