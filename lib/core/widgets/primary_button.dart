import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bouton primaire (fond vert plein) — wrapper explicite autour du thème,
/// pour un usage direct et lisible dans les pages : `PrimaryButton(...)`
/// plutôt que `ElevatedButton(...)`.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.fullWidth = true,
    this.loading = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool fullWidth;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: loading
          ? SizedBox(
              width: 20.sp,
              height: 20.sp,
              child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : Text(label),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

/// Bouton secondaire (contour) — wrapper explicite autour du thème.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    this.fullWidth = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(onPressed: onPressed, child: Text(label));
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
