import 'package:equatable/equatable.dart';

/// Modèle métier d'un événement (concert, festival, exposition...).
class EventModel extends Equatable {
  const EventModel({
    required this.id,
    required this.title,
    required this.venue,
    required this.date,
  });

  final String id;
  final String title;
  final String venue;
  final String date;

  @override
  List<Object?> get props => [id, title, venue, date];
}
