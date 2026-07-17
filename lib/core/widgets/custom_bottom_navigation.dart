import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';

/// Bottom Navigation officielle de Naluki.
///
/// 4 onglets réels (Accueil, Explorer, Réservations, Profil) gérés par le
/// [StatefulShellRoute] de GoRouter (l'état actif suit la branche courante),
/// + un bouton central flottant ("+") pour une action rapide (recherche).
class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    required this.currentIndex,
    required this.onTabSelected,
    required this.onQuickAction,
    super.key,
  });

  /// Index de l'onglet actif (0: Accueil, 1: Explorer, 2: Réservations, 3: Profil).
  final int currentIndex;

  /// Appelé quand un onglet est sélectionné.
  final ValueChanged<int> onTabSelected;

  /// Appelé quand le bouton central "+" est pressé.
  final VoidCallback onQuickAction;

  static const List<_NavItem> _items = [
    _NavItem(icon: AppIcons.home, label: 'Accueil'),
    _NavItem(icon: AppIcons.explore, label: 'Explorer'),
    _NavItem(icon: AppIcons.bookings, label: 'Réservations'),
    _NavItem(icon: AppIcons.profile, label: 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppShadows.elevated,
      ),
      child: SafeArea(
        child: SizedBox(
          height: AppSizes.bottomNavHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab(0),
              _buildTab(1),
              _buildQuickAction(),
              _buildTab(2),
              _buildTab(3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    final item = _items[index];
    final isActive = index == currentIndex;
    final color = isActive ? AppColors.navActive : AppColors.navInactive;

    return Expanded(
      child: InkWell(
        onTap: () => onTabSelected(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: color, size: AppSizes.iconMd),
            SizedBox(height: 2.h),
            Text(
              item.label,
              style: AppTextStyles.caption.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction() {
    return GestureDetector(
      onTap: onQuickAction,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: AppRadius.fullRadius,
          boxShadow: AppShadows.card,
        ),
        child: Icon(AppIcons.add, color: AppColors.textOnPrimary, size: AppSizes.iconMd),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
