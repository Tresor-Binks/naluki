import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Illustration de l'écran d'onboarding.
///
/// Utilise l'asset réel `assets/images/onboarding_illustration.png`
/// (fond transparent) fourni par le design — reproduction pixel-perfect.
class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/onboarding_illustration.png',
      width: double.infinity,
      height: 500.h,
      fit: BoxFit.contain,
    );
  }
}
