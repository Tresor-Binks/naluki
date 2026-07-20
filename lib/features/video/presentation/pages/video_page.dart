import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../place/presentation/controllers/place_providers.dart';

/// Écran vidéo immersive d'un lieu (route `/video/:placeId`).
class VideoPage extends ConsumerWidget {
  const VideoPage({required this.placeId, super.key});

  final String placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.watch(placeByIdProvider(placeId));

    if (place == null) {
      return const Scaffold(backgroundColor: Colors.black, body: SizedBox.shrink());
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fond vidéo (placeholder sombre en attendant l'intégration player)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade900, Colors.black],
                ),
              ),
            ),
          ),
          Center(
            child: Icon(Icons.play_circle_fill_rounded, color: Colors.white.withValues(alpha: 0.85), size: 64.sp),
          ),

          // Barre du haut
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            left: AppSpacing.pageHorizontal,
            right: AppSpacing.pageHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                ),
                Column(
                  children: [
                    Text(place.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    Text(place.area, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12.sp)),
                  ],
                ),
                const Icon(Icons.search_rounded, color: Colors.white),
              ],
            ),
          ),

          // Actions latérales (like, commentaires, partage)
          Positioned(
            right: AppSpacing.lg,
            bottom: 140.h,
            child: Column(
              children: [
                const _VideoAction(icon: Icons.favorite_rounded, label: '128'),
                SizedBox(height: AppSpacing.xl),
                const _VideoAction(icon: Icons.chat_bubble_rounded, label: '12'),
                SizedBox(height: AppSpacing.xl),
                const _VideoAction(icon: Icons.share_rounded, label: 'Partager'),
              ],
            ),
          ),

          // Légende + champ commentaire
          Positioned(
            left: AppSpacing.pageHorizontal,
            right: 80.w,
            bottom: AppSpacing.xxl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ambiance du soir 🌙', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                Text('Réservez votre table !', style: TextStyle(color: Colors.white.withValues(alpha: 0.85))),
                SizedBox(height: AppSpacing.md),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Text(
                    'Ajouter un commentaire...',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoAction extends StatelessWidget {
  const _VideoAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textOnPrimary, size: 26.sp),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 11.sp)),
      ],
    );
  }
}
