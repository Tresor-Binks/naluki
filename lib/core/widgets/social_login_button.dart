import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';

/// Bouton de connexion sociale ("Continuer avec Google/Apple").
///
/// ⚠️ Icônes génériques provisoires. Google et Apple imposent chacun leurs
/// propres règles graphiques strictes (Sign in with Google / Apple HIG) :
/// avant mise en production, remplacer par les boutons officiels générés
/// via les packages `google_sign_in` / `sign_in_with_apple` plutôt que de
/// redessiner les logos à la main.
class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    required this.leading,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final Widget leading;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading,
            SizedBox(width: 10.w),
            Text(label, style: AppTextStyles.label.copyWith(color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
