import 'package:equatable/equatable.dart';

/// Statut d'une réservation.
enum BookingStatus { confirmed, pending, cancelled }

/// Modèle métier d'une réservation.
class BookingModel extends Equatable {
  const BookingModel({
    required this.id,
    required this.placeId,
    required this.placeName,
    required this.dateLabel,
    required this.timeLabel,
    required this.guests,
    this.status = BookingStatus.confirmed,
  });

  final String id;
  final String placeId;
  final String placeName;
  final String dateLabel;
  final String timeLabel;
  final int guests;
  final BookingStatus status;

  String get guestsLabel => '$guests personne${guests > 1 ? 's' : ''}';

  String get statusLabel => switch (status) {
        BookingStatus.confirmed => 'Confirmée',
        BookingStatus.pending => 'En attente',
        BookingStatus.cancelled => 'Annulée',
      };

  @override
  List<Object?> get props => [id, placeId, placeName, dateLabel, timeLabel, guests, status];
}
