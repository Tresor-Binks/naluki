import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

/// Widget racine de l'application Naluki.
///
/// ⚠️ Étape "Navigation" :
/// - GoRouter ([AppRouter.router]) est maintenant branché via `MaterialApp.router`.
/// - Toutes les routes sont centralisées dans `core/router/route_names.dart`.
/// - Les pages sont encore des squelettes ("Pages statiques" = étape suivante).
class NalukiApp extends StatelessWidget {
  const NalukiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Taille de référence basée sur la maquette (iPhone-like, 375x812).
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Naluki',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}

