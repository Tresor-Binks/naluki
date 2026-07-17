import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/social_login_button.dart';

/// Écran d'inscription.
///
/// ⚠️ La maquette fournie regroupe "Connexion / Inscription" sous un même
/// écran numéroté (le formulaire visible est celui de connexion) : cette
/// page d'inscription reprend donc le même langage visuel (boutons sociaux,
/// champs, bouton primaire) par cohérence, avec les champs supplémentaires
/// usuels (nom, confirmation du mot de passe).
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Créer un compte', style: AppTextStyles.headingLarge),
              SizedBox(height: AppSpacing.xs),
              Text('Rejoignez Naluki en quelques secondes', style: AppTextStyles.bodyMedium),
              SizedBox(height: AppSpacing.xxl),

              SocialLoginButton(
                leading: Image.asset('assets/icons/google_icon.png', width: 24.w, height: 24.w),
                label: 'Continuer avec Google',
                onPressed: () => context.goNamed(RouteNames.home),
              ),
              SizedBox(height: AppSpacing.sm),
              SocialLoginButton(
                leading: Image.asset('assets/icons/apple_icon.png', width: 24.w, height: 24.w),
                label: 'Continuer avec Apple',
                onPressed: () => context.goNamed(RouteNames.home),
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: Text('ou', style: AppTextStyles.caption),
                  ),
                  const Expanded(child: Divider(color: AppColors.border)),
                ],
              ),
              SizedBox(height: AppSpacing.xl),

              Text('Nom complet', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const TextField(decoration: InputDecoration(hintText: 'Ex: Jean Moukoko')),
              SizedBox(height: AppSpacing.lg),

              Text('Email ou téléphone', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Ex: 06 000 00 00'),
              ),
              SizedBox(height: AppSpacing.lg),

              Text('Mot de passe', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.textTertiary,
                      size: 20.sp,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.xxl),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.goNamed(RouteNames.home),
                  child: const Text('Créer mon compte'),
                ),
              ),
              SizedBox(height: AppSpacing.xl),

              Center(
                child: GestureDetector(
                  onTap: () => context.goNamed(RouteNames.login),
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodyMedium,
                      children: [
                        const TextSpan(text: 'Déjà un compte ? '),
                        TextSpan(
                          text: 'Se connecter',
                          style: AppTextStyles.label.copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
