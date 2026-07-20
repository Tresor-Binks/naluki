import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Brouillon de réservation en cours de création, le temps de traverser
/// Réservation → Paiement. Consommé (et vidé) dès que le paiement est
/// confirmé.
class PendingBooking {
  const PendingBooking({
    required this.placeId,
    required this.placeName,
    required this.dateLabel,
    required this.timeLabel,
    required this.guests,
  });

  final String placeId;
  final String placeName;
  final String dateLabel;
  final String timeLabel;
  final int guests;
}

class PendingBookingController extends Notifier<PendingBooking?> {
  @override
  PendingBooking? build() => null;

  void set(PendingBooking booking) => state = booking;

  void clear() => state = null;
}

final pendingBookingControllerProvider = NotifierProvider<PendingBookingController, PendingBooking?>(
  PendingBookingController.new,
);
