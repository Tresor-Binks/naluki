import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../../../place/presentation/controllers/place_providers.dart';
import '../controllers/pending_booking_controller.dart';

/// Écran "Réserver une table" (route `/booking/:placeId`).
class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({required this.placeId, super.key});

  final String placeId;

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  int _guests = 2;
  static const _dateLabel = 'Samedi 25 Mai 2024';
  static const _timeLabel = '20:00';

  @override
  Widget build(BuildContext context) {
    final place = ref.watch(placeByIdProvider(widget.placeId));

    if (place == null) return const Scaffold(body: LoadingWidget());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Réserver une table'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mini carte du lieu
              Container(
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: AppRadius.cardRadius),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: AppRadius.inputRadius),
                      child: Icon(AppIcons.location, color: AppColors.primary, size: 20.sp),
                    ),
                    SizedBox(width: AppSpacing.md),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(place.name, style: AppTextStyles.headingSmall),
                        Text(place.subtitle, style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xxl),

              Text('Date', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const _FormTile(icon: Icons.calendar_today_rounded, label: _dateLabel),
              SizedBox(height: AppSpacing.lg),

              Text('Heure', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const _FormTile(icon: Icons.access_time_rounded, label: _timeLabel),
              SizedBox(height: AppSpacing.lg),

              Text('Nombre de personnes', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: AppRadius.inputRadius),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$_guests personne${_guests > 1 ? 's' : ''}', style: AppTextStyles.bodyLarge),
                    Row(
                      children: [
                        _StepperButton(
                          icon: Icons.remove_rounded,
                          onTap: () {
                            if (_guests > 1) setState(() => _guests--);
                          },
                        ),
                        SizedBox(width: AppSpacing.md),
                        _StepperButton(icon: Icons.add_rounded, onTap: () => setState(() => _guests++)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              Text('Notes (facultatif)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const TextField(
                maxLines: 2,
                decoration: InputDecoration(hintText: 'Anniversaire, demande spéciale...'),
              ),
              SizedBox(height: AppSpacing.xxl),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: AppTextStyles.label),
                  Text('Gratuit', style: AppTextStyles.priceLarge.copyWith(color: AppColors.primary)),
                ],
              ),
              SizedBox(height: AppSpacing.xl),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Alimente le brouillon partagé, consommé par l'écran Paiement
                    // pour créer la vraie réservation à la confirmation.
                    ref.read(pendingBookingControllerProvider.notifier).set(
                          PendingBooking(
                            placeId: place.id,
                            placeName: place.name,
                            dateLabel: _dateLabel,
                            timeLabel: _timeLabel,
                            guests: _guests,
                          ),
                        );
                    context.pushNamed(RouteNames.payment);
                  },
                  child: const Text('Continuer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormTile extends StatelessWidget {
  const _FormTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: AppRadius.inputRadius),
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: AppColors.textSecondary),
          SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTextStyles.bodyLarge),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: const BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
        child: Icon(icon, size: 16.sp, color: AppColors.primary),
      ),
    );
  }
}
