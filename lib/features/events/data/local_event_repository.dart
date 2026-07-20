import '../domain/models/event_model.dart';
import '../domain/repositories/event_repository.dart';

/// Implémentation locale (en mémoire) de [EventRepository].
class LocalEventRepository implements EventRepository {
  static const List<EventModel> _seed = [
    EventModel(
      id: 'concert-extra-musica',
      title: 'Concert Extra Musica',
      venue: 'Institut Français',
      date: '24 Mai • 19:00',
    ),
    EventModel(
      id: 'festival-nsangu-ndji-ndji',
      title: 'Festival N’Sangu Ndji Ndji',
      venue: 'Place de la République',
      date: '25 Mai • 10:00',
    ),
    EventModel(
      id: 'soiree-afro-vibes',
      title: 'Soirée Afro Vibes',
      venue: 'Lounge 242',
      date: '25 Mai • 22:00',
    ),
    EventModel(
      id: 'exposition-photo',
      title: 'Exposition Photo',
      venue: 'Mémorial Pierre Savorgnan',
      date: '26 Mai • 09:00',
    ),
  ];

  @override
  Future<List<EventModel>> getAll() async => _seed;
}
