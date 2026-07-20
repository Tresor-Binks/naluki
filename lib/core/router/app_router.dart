import 'package:go_router/go_router.dart';

import '../constants/app_animations.dart';
import 'main_shell.dart';
import 'route_names.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/signup_page.dart';
import '../../features/admin/presentation/pages/admin_moderation_page.dart';
import '../../features/admin/presentation/pages/admin_stats_page.dart';
import '../../features/booking/presentation/pages/booking_page.dart';
import '../../features/booking/presentation/pages/bookings_list_page.dart';
import '../../features/events/presentation/pages/events_page.dart';
import '../../features/explore/presentation/pages/explore_page.dart';
import '../../features/explore/presentation/pages/itineraries_page.dart';
import '../../features/explore/presentation/pages/search_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/filters/presentation/pages/filters_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/splash_page.dart';
import '../../features/payment/presentation/pages/payment_page.dart';
import '../../features/place/presentation/pages/place_detail_page.dart';
import '../../features/professional/presentation/pages/pro_bookings_page.dart';
import '../../features/professional/presentation/pages/pro_dashboard_page.dart';
import '../../features/professional/presentation/pages/pro_listing_page.dart';
import '../../features/professional/presentation/pages/pro_promotions_page.dart';
import '../../features/professional/presentation/pages/pro_reviews_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/video/presentation/pages/video_page.dart';

/// Router centralisé de Naluki.
///
/// - Routes top-level (splash, onboarding, login, signup, place, booking,
///   payment, video, events, map, filters, favorites) : navigation classique
///   avec pile (push/pop).
/// - [StatefulShellRoute] pour les 4 onglets principaux (Accueil, Explorer,
///   Réservations, Profil) : chaque onglet garde sa propre pile, l'état actif
///   de la Bottom Navigation suit la branche courante.
abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splashPath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RouteNames.splashPath,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.onboardingPath,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: RouteNames.loginPath,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.signupPath,
        name: RouteNames.signup,
        builder: (context, state) => const SignupPage(),
      ),

      // -------------------------------------------------------------
      // Onglets principaux (Bottom Navigation)
      // -------------------------------------------------------------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.homePath,
                name: RouteNames.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.explorePath,
                name: RouteNames.explore,
                builder: (context, state) => const ExplorePage(),
                routes: [
                  GoRoute(
                    path: 'search',
                    name: RouteNames.search,
                    builder: (context, state) => const SearchPage(),
                  ),
                  GoRoute(
                    path: 'parcours',
                    name: RouteNames.itineraries,
                    builder: (context, state) => const ItinerariesPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.bookingsPath,
                name: RouteNames.bookings,
                builder: (context, state) => const BookingsListPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.profilePath,
                name: RouteNames.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // -------------------------------------------------------------
      // Lieu / réservation / paiement / vidéo
      // -------------------------------------------------------------
      GoRoute(
        path: RouteNames.placeDetailPath,
        name: RouteNames.placeDetail,
        builder: (context, state) => PlaceDetailPage(placeId: state.pathParameters['placeId']!),
      ),
      GoRoute(
        path: RouteNames.bookingPath,
        name: RouteNames.booking,
        builder: (context, state) => BookingPage(placeId: state.pathParameters['placeId']!),
      ),
      GoRoute(
        path: RouteNames.paymentPath,
        name: RouteNames.payment,
        builder: (context, state) => const PaymentPage(),
      ),
      GoRoute(
        path: RouteNames.videoPath,
        name: RouteNames.video,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: VideoPage(placeId: state.pathParameters['placeId']!),
          transitionDuration: AppAnimations.pageTransitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              AppAnimations.fade(animation: animation, child: child),
        ),
      ),

      // -------------------------------------------------------------
      // Événements / carte / filtres / favoris
      // -------------------------------------------------------------
      GoRoute(
        path: RouteNames.eventsPath,
        name: RouteNames.events,
        builder: (context, state) => const EventsPage(),
      ),
      GoRoute(
        path: RouteNames.mapPath,
        name: RouteNames.map,
        builder: (context, state) => const MapPage(),
      ),
      GoRoute(
        path: RouteNames.filtersPath,
        name: RouteNames.filters,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const FiltersPage(),
          transitionDuration: AppAnimations.pageTransitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              AppAnimations.slideUp(animation: animation, child: child),
        ),
      ),
      GoRoute(
        path: RouteNames.favoritesPath,
        name: RouteNames.favorites,
        builder: (context, state) => const FavoritesPage(),
      ),

      // -------------------------------------------------------------
      // Espace Professionnel (démo)
      // -------------------------------------------------------------
      GoRoute(
        path: RouteNames.proDashboardPath,
        name: RouteNames.proDashboard,
        builder: (context, state) => const ProDashboardPage(),
      ),
      GoRoute(
        path: RouteNames.proListingPath,
        name: RouteNames.proListing,
        builder: (context, state) => const ProListingPage(),
      ),
      GoRoute(
        path: RouteNames.proBookingsPath,
        name: RouteNames.proBookings,
        builder: (context, state) => const ProBookingsPage(),
      ),
      GoRoute(
        path: RouteNames.proPromotionsPath,
        name: RouteNames.proPromotions,
        builder: (context, state) => const ProPromotionsPage(),
      ),
      GoRoute(
        path: RouteNames.proReviewsPath,
        name: RouteNames.proReviews,
        builder: (context, state) => const ProReviewsPage(),
      ),

      // -------------------------------------------------------------
      // Back-office Admin (démo)
      // -------------------------------------------------------------
      GoRoute(
        path: RouteNames.adminModerationPath,
        name: RouteNames.adminModeration,
        builder: (context, state) => const AdminModerationPage(),
      ),
      GoRoute(
        path: RouteNames.adminStatsPath,
        name: RouteNames.adminStats,
        builder: (context, state) => const AdminStatsPage(),
      ),
    ],
  );
}
