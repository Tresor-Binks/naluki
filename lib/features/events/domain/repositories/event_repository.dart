import '../models/event_model.dart';

/// Contrat d'accès aux données d'événements.
abstract interface class EventRepository {
  Future<List<EventModel>> getAll();
}
