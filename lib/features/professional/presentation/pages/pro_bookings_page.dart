import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/simple_bottom_nav_bar.dart';
import '../../../../core/widgets/status_badge.dart';
import '../widgets/pro_nav.dart';

/// Écran "Réservations" de l'espace professionnel.
class ProBookingsPage extends StatefulWidget {
  const ProBookingsPage({super.key});

  @override
  State<ProBookingsPage> createState() => _ProBookingsPageState();
}

class _ProBookingsPageState extends State<ProBookingsPage> {
  static const _tabs = ['Toutes', 'Aujourd’hui', 'À venir'];
  String _selected = 'Toutes';

  static const _bookings = [
    (date: 'Sam 25 Mai • 20:00', guests: '2 personnes', tone: StatusTone.success, label: 'Confirmée'),
    (date: 'Dim 26 Mai • 19:00', guests: '4 personnes', tone: StatusTone.warning, label: 'En attente'),
    (date: 'Lun 27 Mai • 12:30', guests: '3 personnes', tone: StatusTone.success, label: 'Confirmée'),
    (date: 'Mar 26 Mai • 13:00', guests: '2 personnes', tone: StatusTone.error, label: 'Annulée'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Réservations'),
      ),
      bottomNavigationBar: SimpleBottomNavBar(items: proNavItems, currentIndex: 2, onTap: (i) => onProNavTap(context, i)),
      body: Column(
        children: [
          SizedBox(height: AppSpacing.sm),
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.sm),
              itemCount: _bookings.length,
              separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final booking = _bookings[index];
                return Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(booking.date, style: AppTextStyles.headingSmall),
                            Text(booking.guests, style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ),
                      StatusBadge(label: booking.label, tone: booking.tone),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
