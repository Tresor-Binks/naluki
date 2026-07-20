import '../models/booking_model.dart';

/// Contrat d'accès aux données de réservations.
abstract interface class BookingRepository {
  Future<List<BookingModel>> getAll();
  Future<void> add(BookingModel booking);
}
