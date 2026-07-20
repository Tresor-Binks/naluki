import 'package:equatable/equatable.dart';

/// Modèle métier d'un lieu (restaurant, hôtel, bar, activité...).
///
/// Phase 2 : alimenté par [LocalPlaceRepository] (données en mémoire, prêtes
/// à être remplacées par un vrai appel API en Phase 3/4 sans changer ce
/// modèle ni les widgets qui l'utilisent). L'état `isFavorite` n'est pas
/// stocké ici de façon persistante : il est recalculé à la volée à partir de
/// [FavoritesController] — voir `place_providers.dart`.
class PlaceModel extends Equatable {
  const PlaceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.type,
    required this.area,
    required this.rating,
    required this.reviewCount,
    required this.durationMinutesMin,
    required this.durationMinutesMax,
    this.imageAsset,
    this.isOpen = true,
    this.isFavorite = false,
  });

  final String id;
  final String name;

  /// Catégorie utilisée pour le filtrage (Explorer, Filtres) : "Restaurants",
  /// "Hôtels", "Bars", "Activités"...
  final String category;

  /// Type précis affiché en sous-titre : "Cuisine africaine", "Bar lounge"...
  final String type;
  final String area;
  final double rating;
  final int reviewCount;
  final int durationMinutesMin;
  final int durationMinutesMax;

  /// Chemin de l'image (`assets/images/...`). `null` → [RoundedImage] affiche
  /// un placeholder en attendant la vraie photo.
  final String? imageAsset;
  final bool isOpen;
  final bool isFavorite;

  String get subtitle => '$type • $area';

  String get durationLabel => '$durationMinutesMin–$durationMinutesMax min';

  PlaceModel copyWith({bool? isFavorite}) {
    return PlaceModel(
      id: id,
      name: name,
      category: category,
      type: type,
      area: area,
      rating: rating,
      reviewCount: reviewCount,
      durationMinutesMin: durationMinutesMin,
      durationMinutesMax: durationMinutesMax,
      imageAsset: imageAsset,
      isOpen: isOpen,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, name, category, type, area, rating, reviewCount, isFavorite];
}
