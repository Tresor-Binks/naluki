import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Échelle d'espacement officielle de Naluki (basée sur une grille de 4).
///
/// Utiliser exclusivement ces valeurs pour les `padding`, `margin` et
/// `SizedBox` — aucun pixel fixe ne doit apparaître ailleurs dans le code.
abstract final class AppSpacing {
  static double get xs => 4.w;
  static double get sm => 8.w;
  static double get md => 12.w;
  static double get lg => 16.w;
  static double get xl => 20.w;
  static double get xxl => 24.w;
  static double get xxxl => 32.w;
  static double get huge => 40.w;

  /// Marge horizontale standard des écrans (padding de page).
  static double get pageHorizontal => 20.w;

  /// Espacement vertical standard entre sections.
  static double get sectionGap => 24.h;
}
