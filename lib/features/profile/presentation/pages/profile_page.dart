import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/avatar_widget.dart';
import '../../../../core/widgets/menu_list_tile.dart';

/// Écran Profil ("Jean Moukoko", menu de compte).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const AvatarWidget(name: 'Jean Moukoko'),
                  SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jean Moukoko', style: AppTextStyles.headingMedium),
                      GestureDetector(
                        onTap: () {},
                        child: Text('Voir mon profil', style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xxl),
              const Divider(),
              MenuListTile(
                icon: Icons.calendar_today_rounded,
                label: 'Mes réservations',
                onTap: () => context.pushNamed(RouteNames.bookings),
              ),
              const Divider(height: 1),
              MenuListTile(
                icon: Icons.favorite_border_rounded,
                label: 'Mes favoris',
                onTap: () => context.pushNamed(RouteNames.favorites),
              ),
              const Divider(height: 1),
              MenuListTile(icon: Icons.star_border_rounded, label: 'Mes avis', onTap: () {}),
              const Divider(height: 1),
              MenuListTile(icon: Icons.emoji_events_outlined, label: 'Ambassadeur Naluki', onTap: () {}),
              const Divider(height: 1),
              MenuListTile(icon: Icons.download_rounded, label: 'Téléchargements (offline)', onTap: () {}),
              const Divider(height: 1),
              MenuListTile(icon: Icons.settings_outlined, label: 'Paramètres', onTap: () {}),
              const Divider(height: 1),
              MenuListTile(icon: Icons.help_outline_rounded, label: 'Aide & support', onTap: () {}),
              const Divider(height: 1),
              SizedBox(height: AppSpacing.lg),

              Text('Démo', style: AppTextStyles.label.copyWith(color: AppColors.textTertiary)),
              SizedBox(height: AppSpacing.xs),
              MenuListTile(
                icon: Icons.storefront_rounded,
                label: 'Espace professionnel',
                onTap: () => context.pushNamed(RouteNames.proDashboard),
              ),
              const Divider(height: 1),
              MenuListTile(
                icon: Icons.admin_panel_settings_rounded,
                label: 'Back-office admin',
                onTap: () => context.pushNamed(RouteNames.adminStats),
              ),
              const Divider(height: 1),
              SizedBox(height: AppSpacing.md),
              MenuListTile(
                icon: Icons.logout_rounded,
                label: 'Se déconnecter',
                tintColor: AppColors.error,
                onTap: () => context.goNamed(RouteNames.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
