import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadows.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_filter_chip.dart';

/// Écran Parcours & Expériences ("Food Tour", "Culture & Histoire"...).
class ItinerariesPage extends StatefulWidget {
  const ItinerariesPage({super.key});

  @override
  State<ItinerariesPage> createState() => _ItinerariesPageState();
}

class _ItinerariesPageState extends State<ItinerariesPage> {
  static const _tabs = ['Pour vous', 'Populaires', 'Nouveautés'];
  String _selected = 'Pour vous';

  static const _itineraries = [
    (title: 'Food Tour', subtitle: 'Les meilleurs restos', count: '8 lieux', icon: Icons.restaurant_menu_rounded),
    (title: 'Culture & Histoire', subtitle: 'Musées et sites', count: '6 parcours', icon: Icons.museum_rounded),
    (title: 'Détente & Nature', subtitle: 'Parcs et plages', count: '4 parcours', icon: Icons.park_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Parcours'),
        actions: [
          IconButton(icon: const Icon(Icons.search_rounded), onPressed: () {}),
        ],
      ),
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.sm),
              itemCount: _itineraries.length,
              separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final itinerary = _itineraries[index];
                return Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.cardRadius,
                    boxShadow: AppShadows.card,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: AppRadius.inputRadius),
                        child: Icon(itinerary.icon, color: AppColors.primary, size: 24.sp),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(itinerary.title, style: AppTextStyles.headingSmall),
                            Text(itinerary.subtitle, style: AppTextStyles.bodySmall),
                            Text(itinerary.count, style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
                          ],
                        ),
                      ),
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
