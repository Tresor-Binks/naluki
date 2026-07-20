import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/place_card.dart';
import '../../../place/presentation/controllers/place_providers.dart';

/// Écran Carte (localisation des lieux autour de l'utilisateur).
///
/// ⚠️ Placeholder visuel en attendant l'intégration d'un vrai fournisseur de
/// carte (Google Maps / Mapbox) en Phase Backend/API — les marqueurs sont
/// positionnés arbitrairement pour illustrer la mise en page.
class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.watch(placesProvider).valueOrNull?.first;

    return Scaffold(
      body: Stack(
        children: [
          // Placeholder de carte
          Positioned.fill(
            child: Container(
              color: AppColors.primaryLight,
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),

          // Marqueurs
          const Positioned(top: 180, left: 80, child: _MapPin()),
          const Positioned(top: 260, left: 220, child: _MapPin()),
          const Positioned(top: 220, left: 150, child: _MapPin(active: true)),
          const Positioned(top: 340, left: 90, child: _MapPin()),

          // Barre de recherche + retour
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            left: AppSpacing.pageHorizontal,
            right: AppSpacing.pageHorizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: const BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
                    child: Icon(AppIcons.back, size: 18.sp, color: AppColors.textPrimary),
                  ),
                ),
                SizedBox(width: AppSpacing.sm),
                const Expanded(child: CustomSearchBar(hintText: 'Rechercher dans cette zone')),
              ],
            ),
          ),

          // Carte de lieu en bas
          if (place != null)
            Positioned(
              left: AppSpacing.pageHorizontal,
              right: AppSpacing.pageHorizontal,
              bottom: AppSpacing.lg,
              child: PlaceCard(
                place: place,
                onTap: () => context.pushNamed(RouteNames.placeDetail, pathParameters: {'placeId': place.id}),
              ),
            ),
        ],
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  const _MapPin({this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Icon(
      AppIcons.location,
      color: active ? AppColors.accent : AppColors.primary,
      size: active ? 34.sp : 26.sp,
    );
  }
}

/// Simule une grille de rues pour donner l'impression d'une carte.
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.08)
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 32) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += 32) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
