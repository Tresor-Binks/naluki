import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/social_login_button.dart';

/// Écran de connexion — "Bienvenue 👋".
///
/// Reproduction fidèle de la maquette : boutons Google/Apple, séparateur
/// "ou", champs email/téléphone + mot de passe, lien "Mot de passe oublié ?",
/// bouton "Se connecter", lien vers l'inscription.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.md),
              Text('Bienvenue 👋', style: AppTextStyles.headingLarge),
              SizedBox(height: AppSpacing.xs),
              Text(
                'Connectez-vous ou créez\nvotre compte Naluki',
                style: AppTextStyles.bodyMedium,
              ),
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

              Text('Email ou téléphone', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.xs),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Ex: 06 000 00 00'),
              ),
              SizedBox(height: AppSpacing.lg),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mot de passe', style: AppTextStyles.label),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Mot de passe oublié ?',
                      style: AppTextStyles.caption.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
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
                  child: const Text('Se connecter'),
                ),
              ),
              SizedBox(height: AppSpacing.xl),

              Center(
                child: GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.signup),
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodyMedium,
                      children: [
                        const TextSpan(text: 'Pas encore de compte ? '),
                        TextSpan(
                          text: 'S’inscrire',
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
