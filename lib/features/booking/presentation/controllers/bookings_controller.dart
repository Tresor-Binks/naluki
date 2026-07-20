import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local_booking_repository.dart';
import '../../domain/models/booking_model.dart';
import '../../domain/repositories/booking_repository.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) => LocalBookingRepository());

/// Expose la liste des réservations et permet d'en ajouter une nouvelle
/// (utilisé par l'écran Paiement à la confirmation).
class BookingsController extends AsyncNotifier<List<BookingModel>> {
  @override
  Future<List<BookingModel>> build() {
    return ref.watch(bookingRepositoryProvider).getAll();
  }

  Future<void> add(BookingModel booking) async {
    await ref.read(bookingRepositoryProvider).add(booking);
    state = await AsyncValue.guard(() => ref.read(bookingRepositoryProvider).getAll());
  }
}

final bookingsControllerProvider = AsyncNotifierProvider<BookingsController, List<BookingModel>>(
  BookingsController.new,
);
