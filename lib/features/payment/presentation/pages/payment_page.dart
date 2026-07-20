import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/payment_method_tile.dart';
import '../../../booking/domain/models/booking_model.dart';
import '../../../booking/presentation/controllers/bookings_controller.dart';
import '../../../booking/presentation/controllers/pending_booking_controller.dart';

/// Écran de paiement (route `/payment`).
///
/// Lit le brouillon [PendingBooking] posé par l'écran Réservation. À la
/// confirmation ("Payer"), crée une vraie [BookingModel] via
/// [BookingsController] : elle apparaît immédiatement dans "Mes réservations".
class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

enum _Method { airtel, mtn, card, cash }

class _PaymentPageState extends ConsumerState<PaymentPage> {
  _Method _selected = _Method.airtel;
  bool _isPaying = false;

  Future<void> _confirmPayment(PendingBooking pending) async {
    setState(() => _isPaying = true);

    final booking = BookingModel(
      id: 'booking-${DateTime.now().millisecondsSinceEpoch}',
      placeId: pending.placeId,
      placeName: pending.placeName,
      dateLabel: pending.dateLabel,
      timeLabel: pending.timeLabel,
      guests: pending.guests,
      status: BookingStatus.confirmed,
    );

    await ref.read(bookingsControllerProvider.notifier).add(booking);
    ref.read(pendingBookingControllerProvider.notifier).clear();

    if (!mounted) return;
    context.goNamed(RouteNames.bookings);
  }

  @override
  Widget build(BuildContext context) {
    final pending = ref.watch(pendingBookingControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Paiement'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pending?.placeName ?? 'Réservation', style: AppTextStyles.headingMedium),
              SizedBox(height: 2.h),
              Text(
                pending != null
                    ? '${pending.dateLabel} • ${pending.timeLabel} • ${pending.guests} pers.'
                    : '—',
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Méthode de paiement', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.sm),
              PaymentMethodTile(
                icon: Icons.phone_android_rounded,
                iconColor: AppColors.error,
                label: 'Airtel Money',
                subtitle: '06 125 45 67',
                selected: _selected == _Method.airtel,
                onTap: () => setState(() => _selected = _Method.airtel),
              ),
              SizedBox(height: AppSpacing.sm),
              PaymentMethodTile(
                icon: Icons.phone_android_rounded,
                iconColor: AppColors.warning,
                label: 'MTN Mobile Money',
                subtitle: '05 987 65 43',
                selected: _selected == _Method.mtn,
                onTap: () => setState(() => _selected = _Method.mtn),
              ),
              SizedBox(height: AppSpacing.sm),
              PaymentMethodTile(
                icon: Icons.credit_card_rounded,
                iconColor: AppColors.info,
                label: 'Carte bancaire',
                subtitle: '•••• •••• •••• 4242',
                selected: _selected == _Method.card,
                onTap: () => setState(() => _selected = _Method.card),
              ),
              SizedBox(height: AppSpacing.sm),
              PaymentMethodTile(
                icon: Icons.payments_rounded,
                iconColor: AppColors.success,
                label: 'Espèces (sur place)',
                selected: _selected == _Method.cash,
                onTap: () => setState(() => _selected = _Method.cash),
              ),
              SizedBox(height: AppSpacing.huge),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: AppTextStyles.label),
                  Text('0 FCFA', style: AppTextStyles.priceLarge.copyWith(color: AppColors.primary)),
                ],
              ),
              SizedBox(height: AppSpacing.xl),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: pending == null || _isPaying ? null : () => _confirmPayment(pending),
                  child: _isPaying
                      ? SizedBox(
                          width: 20.sp,
                          height: 20.sp,
                          child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Payer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
