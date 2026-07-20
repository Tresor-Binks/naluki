import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local_event_repository.dart';
import '../../domain/models/event_model.dart';
import '../../domain/repositories/event_repository.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) => LocalEventRepository());

final eventsProvider = FutureProvider<List<EventModel>>((ref) {
  return ref.watch(eventRepositoryProvider).getAll();
});
