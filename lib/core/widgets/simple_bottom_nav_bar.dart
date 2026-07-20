import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_shadows.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';

/// Description d'un item de [SimpleBottomNavBar].
class NavItemData {
  const NavItemData({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// Barre de navigation générique à N items (sans bouton central), utilisée
/// par les espaces Professionnel et Admin — [CustomBottomNavigation] reste
/// dédiée au parcours grand public (4 onglets + bouton central).
class SimpleBottomNavBar extends StatelessWidget {
  const SimpleBottomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final List<NavItemData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.surface, boxShadow: AppShadows.elevated),
      child: SafeArea(
        child: SizedBox(
          height: AppSizes.bottomNavHeight,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;
              final color = isActive ? AppColors.navActive : AppColors.navInactive;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: color, size: AppSizes.iconMd),
                      SizedBox(height: 2.h),
                      Text(item.label, style: AppTextStyles.caption.copyWith(color: color)),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
