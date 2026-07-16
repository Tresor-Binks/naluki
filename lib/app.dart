import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Widget racine de l'application Naluki.
///
/// ⚠️ Étape "Structure" uniquement :
/// - Pas de thème custom (AppColors, AppTextStyles...) → étape suivante.
/// - Pas de GoRouter → étape suivante.
/// - Ce widget sera remplacé dès l'étape "Thème & Navigation".
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
        return MaterialApp(
          title: 'Naluki',
          debugShowCheckedModeBanner: false,
          home: const _ScaffoldPlaceholder(),
        );
      },
    );
  }
}

/// Écran temporaire confirmant que la structure du projet compile.
/// Sera supprimé dès que le router et les vraies pages seront branchés.
class _ScaffoldPlaceholder extends StatelessWidget {
  const _ScaffoldPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_rounded, size: 64.sp, color: Colors.green),
              SizedBox(height: 16.h),
              Text(
                'Naluki',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                'Architecture du projet en place ✅\n'
                'Prochaine étape : Design System & Thème',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
