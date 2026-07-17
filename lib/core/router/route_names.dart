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
  // Divers
  // ---------------------------------------------------------------------
  static const String designSystem = 'design-system';
  static const String designSystemPath = '/design-system';
}
