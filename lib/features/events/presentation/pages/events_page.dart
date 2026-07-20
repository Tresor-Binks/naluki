import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/loading_error_widgets.dart';
import '../controllers/event_providers.dart';

/// Écran Événements ("À venir", "Aujourd'hui", "Ce week-end").
class EventsPage extends ConsumerStatefulWidget {
  const EventsPage({super.key});

  @override
  ConsumerState<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends ConsumerState<EventsPage> {
  static const _tabs = ['À venir', 'Aujourd’hui', 'Ce week-end'];
  String _selected = 'À venir';

  @override
  Widget build(BuildContext context) {
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => context.pop()),
        title: const Text('Événements'),
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
            child: eventsAsync.when(
              loading: () => const LoadingWidget(),
              error: (error, stack) => AppErrorWidget(
                message: 'Impossible de charger les événements.',
                onRetry: () => ref.invalidate(eventsProvider),
              ),
              data: (events) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.sm),
                itemCount: events.length,
                separatorBuilder: (_, __) => SizedBox(height: AppSpacing.md),
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.cardRadius),
                    child: Row(
                      children: [
                        Container(
                          width: 56.w,
                          height: 56.w,
                          decoration: BoxDecoration(color: AppColors.accentLight, borderRadius: AppRadius.inputRadius),
                          child: Icon(AppIcons.dashboard, color: AppColors.accentDark, size: 22.sp),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event.title, style: AppTextStyles.headingSmall),
                              Text(event.venue, style: AppTextStyles.bodySmall),
                              Text(event.date, style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
