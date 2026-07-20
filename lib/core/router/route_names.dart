/// Centralisation de toutes les routes de l'application Naluki.
///
/// Chaque route possède un [path] (utilisé par GoRouter) et un [name]
/// (utilisé pour naviguer via `context.goNamed` / `context.pushNamed`,
/// plus sûr qu'une string brute).
abstract final class RouteNames {
  // ---------------------------------------------------------------------
  // Racine / onboarding / authentification
  // ---------------------------------------------------------------------
  static const String splash = 'splash';
  static const String splashPath = '/';

  static const String onboarding = 'onboarding';
  static const String onboardingPath = '/onboarding';

  static const String login = 'login';
  static const String loginPath = '/login';

  static const String signup = 'signup';
  static const String signupPath = '/signup';

  // ---------------------------------------------------------------------
  // Onglets principaux (Bottom Navigation)
  // ---------------------------------------------------------------------
  static const String home = 'home';
  static const String homePath = '/home';

  static const String explore = 'explore';
  static const String explorePath = '/explore';

  static const String bookings = 'bookings';
  static const String bookingsPath = '/bookings';

  static const String profile = 'profile';
  static const String profilePath = '/profile';

  // ---------------------------------------------------------------------
  // Recherche / parcours (sous-pages d'Explorer)
  // ---------------------------------------------------------------------
  static const String search = 'search';
  static const String searchPath = '/explore/search';

  static const String itineraries = 'itineraries';
  static const String itinerariesPath = '/explore/parcours';

  // ---------------------------------------------------------------------
  // Lieu / réservation / paiement
  // ---------------------------------------------------------------------
  static const String placeDetail = 'place-detail';
  static const String placeDetailPath = '/place/:placeId';
  static String placeDetailLocation(String placeId) => '/place/$placeId';

  static const String booking = 'booking';
  static const String bookingPath = '/booking/:placeId';
  static String bookingLocation(String placeId) => '/booking/$placeId';

  static const String payment = 'payment';
  static const String paymentPath = '/payment';

  // ---------------------------------------------------------------------
  // Vidéo / événements / carte / filtres / favoris
  // ---------------------------------------------------------------------
  static const String video = 'video';
  static const String videoPath = '/video/:placeId';
  static String videoLocation(String placeId) => '/video/$placeId';

  static const String events = 'events';
  static const String eventsPath = '/events';

  static const String map = 'map';
  static const String mapPath = '/map';

  static const String filters = 'filters';
  static const String filtersPath = '/filters';

  static const String favorites = 'favorites';
  static const String favoritesPath = '/favorites';

  // ---------------------------------------------------------------------
  // Espace Professionnel (démo — sans authentification/rôle pour l'instant)
  // ---------------------------------------------------------------------
  static const String proDashboard = 'pro-dashboard';
  static const String proDashboardPath = '/professional/dashboard';

  static const String proListing = 'pro-listing';
  static const String proListingPath = '/professional/listing';

  static const String proBookings = 'pro-bookings';
  static const String proBookingsPath = '/professional/bookings';

  static const String proPromotions = 'pro-promotions';
  static const String proPromotionsPath = '/professional/promotions';

  static const String proReviews = 'pro-reviews';
  static const String proReviewsPath = '/professional/reviews';

  // ---------------------------------------------------------------------
  // Back-office Admin (démo)
  // ---------------------------------------------------------------------
  static const String adminModeration = 'admin-moderation';
  static const String adminModerationPath = '/admin/moderation';

  static const String adminStats = 'admin-stats';
  static const String adminStatsPath = '/admin/stats';
}
