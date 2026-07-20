import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../domain/models/booking_model.dart';
import '../controllers/bookings_controller.dart';

/// Écran "Mes réservations" (onglet Bottom Navigation).
class BookingsListPage extends ConsumerStatefulWidget {
  const BookingsListPage({super.key});

  @override
  ConsumerState<BookingsListPage> createState() => _BookingsListPageState();
}

class _BookingsListPageState extends ConsumerState<BookingsListPage> {
  static const _tabs = ['Toutes', 'Aujourd’hui', 'À venir'];
  String _selected = 'Toutes';

  StatusTone _toneFor(BookingStatus status) => switch (status) {
        BookingStatus.confirmed => StatusTone.success,
        BookingStatus.pending => StatusTone.warning,
        BookingStatus.cancelled => StatusTone.error,
      };

  @override
  Widget build(BuildContext context) {
    final bookingsAsync = ref.watch(bookingsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Réservations')),
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              scrollDirection: Axis.horizontal,
              itemCount: _tabs.length,
              separatorBuilder: (_, __) => SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) => AppFilterChip(
                label: _tabs[index],
                selected: _tabs[index] == _selected,
                onTap: () => setState(() => _selected = _tabs[index]),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.md),
          Expanded(
            child: bookingsAsync.when(
              loading: () => const LoadingWidget(),
              error: (error, stack) => AppErrorWidget(
                message: 'Impossible de charger vos réservations.',
                onRetry: () => ref.invalidate(bookingsControllerProvider),
              ),
              data: (bookings) {
                if (bookings.isEmpty) {
                  return const EmptyStateWidget(
                    icon: Icons.calendar_today_outlined,
                    title: 'Aucune réservation',
                    subtitle: 'Réservez une table depuis un lieu pour la voir apparaître ici.',
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.sm),
                  itemCount: bookings.length,
                  separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                      child: Row(
                        children: [
                          Container(
                            width: 44.w,
                            height: 44.w,
                            decoration:
                                BoxDecoration(color: AppColors.primaryLight, borderRadius: AppRadius.inputRadius),
                            child: Icon(AppIcons.bookings, color: AppColors.primary, size: 20.sp),
                          ),
                          SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(booking.placeName, style: AppTextStyles.headingSmall),
                                Text('${booking.dateLabel} • ${booking.timeLabel}', style: AppTextStyles.bodySmall),
                                Text(booking.guestsLabel, style: AppTextStyles.bodySmall),
                              ],
                            ),
                          ),
                          StatusBadge(label: booking.statusLabel, tone: _toneFor(booking.status)),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
