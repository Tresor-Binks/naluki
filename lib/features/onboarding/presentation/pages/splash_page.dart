import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/naluki_logo.dart';

/// Écran de démarrage (route `/`).
///
/// ⚠️ Non détaillé dans la maquette fournie (les écrans numérotés
/// commencent à "Onboarding") : ce splash reprend simplement l'identité de
/// marque (logo + tagline) sur le fond crème de l'app, avec une transition
/// automatique après un court délai — purement visuel, aucune logique
/// métier.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1400), () {
      if (mounted) context.goNamed(RouteNames.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: NalukiLogo(size: 120)),
    );
  }
}
