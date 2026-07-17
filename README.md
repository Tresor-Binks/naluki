# Naluki 🌍 — Find your place

Application mobile Flutter (Android / iOS) — **Phase 1, Étape 1 : Structure du projet**.

## ✅ Ce qui est fait

**Étape 1 — Structure du projet**
- Projet Flutter initialisé (`pubspec.yaml` avec les dépendances validées).
- Architecture Clean & évolutive en place (dossiers créés, y compris ceux vides).
- Riverpod (`ProviderScope`) et `flutter_screenutil` branchés dans `main.dart` / `app.dart`.

**Étape 2 — Design System & Thème**
- `AppColors` : palette extraite par échantillonnage pixel direct de la maquette
  (vert `#0E6B34`, orange `#F59E0B`, fond crème `#F9F5F0`, texte `#221A12`...).
- `AppTextStyles` : échelle typographique complète en **Google Fonts / Poppins**
  (hypothèse à valider — police visuellement la plus proche de la maquette).
- `AppSpacing`, `AppRadius`, `AppShadows`, `AppSizes`, `AppDurations`, `AppAnimations`, `AppIcons`.
- `AppTheme.light` : `ThemeData` Material 3 complet (AppBar, boutons, champs,
  cartes, chips, bottom navigation, dividers) construit à partir du Design System.
- `AppTheme.dark` : structure préparée (copie du light avec `Brightness.dark`),
  à finaliser lors de l'activation officielle du Dark Mode.
- Une page de démonstration temporaire (`DesignSystemPreviewPage`) affiche
  couleurs, typographie, boutons et une carte-exemple pour validation visuelle
  avant de commencer le routing et les vraies pages.

## 🚫 Ce qui n'est PAS encore fait (volontaire)

- GoRouter et les routes
- Les pages statiques de la maquette
- Widgets réutilisables métier (`PrimaryButton`, `PlaceCard`, `CustomBottomNavigation`, etc.)
- Fake data

## 🎨 Palette (extraite de la maquette)

| Token | Hex | Usage |
|---|---|---|
| `primary` | `#0E6B34` | Logo, boutons CTA, actif |
| `accent` | `#F59E0B` | Tagline, anneau logo, promos |
| `background` | `#F9F5F0` | Fond de page |
| `surface` | `#FFFFFF` | Cartes, champs |
| `textPrimary` | `#221A12` | Titres |
| `textSecondary` | `#6F6B63` | Sous-titres |

## 📁 Architecture

```
lib/
├── main.dart                     # Point d'entrée
├── app.dart                      # Widget racine (placeholder pour l'instant)
├── core/
│   ├── config/                   # Config générale de l'app
│   ├── colors/                   # AppColors — LA seule source de couleurs de l'app
│   ├── theme/                    # AppTextStyles, AppTheme (Light + Dark)
│   ├── router/                   # (vide) → GoRouter
│   ├── constants/                # (vide) → AppSpacing, AppRadius, AppDurations...
│   ├── extensions/                # (vide) → extensions Dart utilitaires
│   ├── widgets/                   # (vide) → PrimaryButton, PlaceCard, CustomAppBar...
│   ├── utils/                    # (vide) → helpers génériques
│   └── services/                 # (vide) → services partagés (phases suivantes)
├── shared/                        # (vide) → éléments transverses aux features
└── features/
    ├── onboarding/
    ├── authentication/
    ├── home/
    ├── explore/
    ├── place/
    ├── booking/
    ├── payment/
    ├── favorites/
    ├── events/
    ├── profile/
    ├── video/
    ├── filters/
    ├── map/
    ├── professional/
    └── admin/
```

Chaque feature suit la Clean Architecture :

```
features/<feature>/
├── data/                # Sources de données (fake data pour l'instant, API plus tard)
├── domain/
│   └── models/          # Entités / modèles métier
└── presentation/
    ├── pages/           # Écrans (StatelessWidget/ConsumerWidget)
    ├── widgets/          # Widgets spécifiques à la feature
    └── controllers/      # Providers Riverpod (StateNotifier / Notifier)
```

## 📦 Dépendances installées

| Package | Rôle |
|---|---|
| `flutter_riverpod` | Gestion d'état (unique solution utilisée) |
| `go_router` | Navigation centralisée (étape suivante) |
| `flutter_screenutil` | Responsive (aucun pixel fixe) |
| `google_fonts` | Typographie identique à la maquette |
| `flutter_svg` | Icônes vectorielles |
| `cached_network_image` | Images réseau (phases suivantes) |
| `equatable` | Comparaison de modèles (fake data / domain) |
| `flutter_lints` | Qualité de code, 0 warning |

## ▶️ Lancer le projet

```bash
flutter pub get
flutter run
```

Vous verrez un écran de confirmation simple : *"Architecture du projet en place ✅"*.

## ➡️ Prochaine étape (en attente de validation)

**Navigation** : mise en place de GoRouter, centralisation de toutes les routes
(`/`, `/onboarding`, `/login`, `/home`, `/explore`, `/place`, `/booking`, `/payment`,
`/favorites`, `/events`, `/profile`, `/filters`, `/map`, `/video`...) avec des pages
squelettes vides pour chacune, puis la `CustomBottomNavigation`.
