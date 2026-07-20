import '../domain/models/booking_model.dart';
import '../domain/repositories/booking_repository.dart';

/// Implémentation locale (en mémoire) de [BookingRepository].
///
/// Pré-remplie avec les exemples de la maquette ; les réservations créées
/// via le vrai parcours Réservation → Paiement viennent s'y ajouter.
class LocalBookingRepository implements BookingRepository {
  final List<BookingModel> _bookings = [
    const BookingModel(
      id: 'seed-1',
      placeId: 'chill-restaurant',
      placeName: 'Le Chill Restaurant',
      dateLabel: 'Sam 25 Mai',
      timeLabel: '20:00',
      guests: 2,
      status: BookingStatus.confirmed,
    ),
    const BookingModel(
      id: 'seed-2',
      placeId: 'ma-terrasse',
      placeName: 'Ma Terrasse',
      dateLabel: 'Dim 26 Mai',
      timeLabel: '19:00',
      guests: 4,
      status: BookingStatus.pending,
    ),
    const BookingModel(
      id: 'seed-3',
      placeId: 'chez-anto',
      placeName: 'Chez Anto',
      dateLabel: 'Lun 27 Mai',
      timeLabel: '12:30',
      guests: 3,
      status: BookingStatus.confirmed,
    ),
    const BookingModel(
      id: 'seed-4',
      placeId: 'lounge-242',
      placeName: 'Lounge 242',
      dateLabel: 'Mar 26 Mai',
      timeLabel: '13:00',
      guests: 2,
      status: BookingStatus.cancelled,
    ),
  ];

  @override
  Future<List<BookingModel>> getAll() async => List.unmodifiable(_bookings);

  @override
  Future<void> add(BookingModel booking) async {
    _bookings.insert(0, booking);
  }
}
