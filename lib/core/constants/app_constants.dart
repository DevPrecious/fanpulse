class AppConstants {
  static const String appName = 'FanPulse';
  
  // Navigation - Auth
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String forgotPasswordRoute = '/forgot-password';
  
  // Navigation - Main
  static const String homeRoute = '/home';
  static const String liveMatchRoute = '/live-match';
  static const String pollsRoute = '/polls';
  static const String predictionsRoute = '/predictions';
  static const String chatroomsRoute = '/chatrooms';
  static const String profileRoute = '/profile';
  static const String leaderboardRoute = '/leaderboard';
  
  // Fan Ranks
  static const List<String> fanRanks = [
    'Rookie',
    'Fan',
    'Supporter',
    'Captain',
    'Legend',
  ];
  
  // Badge Icons (emojis for now)
  static const String badgeTopPredictor = '🎯';
  static const String badgeClubLoyalist = '⚽';
  static const String badgeHotCommenter = '🔥';
  static const String badgeLegend = '👑';
  
  // Match Events
  static const List<String> matchEvents = [
    'Goal',
    'Corner',
    'Red Card',
    'Yellow Card',
    'Penalty',
    'Substitution',
  ];
  
  // Reactions
  static const List<String> reactions = [
    '🔥',
    '👏',
    '😡',
    '💔',
    '⚡',
    '🎉',
  ];
}

