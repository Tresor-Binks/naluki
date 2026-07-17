import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Logo Naluki officiel (badge + wordmark + tagline).
///
/// Utilise l'asset réel `assets/images/logo.png` (fond transparent) fourni
/// par le design — reproduction pixel-perfect.
class NalukiLogo extends StatelessWidget {
  const NalukiLogo({this.size = 96, this.showWordmark = true, super.key});

  /// Largeur du badge (en logical pixels, avant `.r`). La hauteur suit le
  /// ratio naturel de l'image (badge + wordmark inclus dans le PNG).
  final double size;

  /// Si `false`, n'affiche que le pin (recadre la partie haute du PNG,
  /// qui contient le pin + le wordmark empilés verticalement).
  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      'assets/images/logo.png',
      width: size.r,
      fit: BoxFit.contain,
    );

    if (showWordmark) return image;

    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.62,
        child: image,
      ),
    );
  }
}
