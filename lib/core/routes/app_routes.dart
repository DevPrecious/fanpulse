import 'package:get/get.dart';
import 'package:fanpulse/core/constants/app_constants.dart';
import 'package:fanpulse/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:fanpulse/presentation/screens/auth/login_screen.dart';
import 'package:fanpulse/presentation/screens/auth/signup_screen.dart';
import 'package:fanpulse/presentation/screens/auth/forgot_password_screen.dart';
import 'package:fanpulse/presentation/screens/home/home_screen.dart';
import 'package:fanpulse/presentation/screens/live_match/live_match_screen.dart';
import 'package:fanpulse/presentation/screens/polls/polls_screen.dart';
import 'package:fanpulse/presentation/screens/predictions/predictions_screen.dart';
import 'package:fanpulse/presentation/screens/chatrooms/chatrooms_screen.dart';
import 'package:fanpulse/presentation/screens/profile/profile_screen.dart';
import 'package:fanpulse/presentation/screens/leaderboard/leaderboard_screen.dart';
import 'package:fanpulse/presentation/controllers/onboarding_controller.dart';
import 'package:fanpulse/presentation/controllers/auth_controller.dart';
import 'package:fanpulse/presentation/controllers/home_controller.dart';
import 'package:fanpulse/presentation/controllers/live_match_controller.dart';
import 'package:fanpulse/presentation/controllers/polls_controller.dart';
import 'package:fanpulse/presentation/controllers/predictions_controller.dart';
import 'package:fanpulse/presentation/controllers/chatrooms_controller.dart';
import 'package:fanpulse/presentation/controllers/profile_controller.dart';
import 'package:fanpulse/presentation/controllers/leaderboard_controller.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: AppConstants.onboardingRoute,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
    ),
    GetPage(
      name: AppConstants.loginRoute,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppConstants.signupRoute,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppConstants.forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppConstants.homeRoute,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppConstants.liveMatchRoute,
      page: () => const LiveMatchScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LiveMatchController>(() => LiveMatchController());
      }),
    ),
    GetPage(
      name: AppConstants.pollsRoute,
      page: () => const PollsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PollsController>(() => PollsController());
      }),
    ),
    GetPage(
      name: AppConstants.predictionsRoute,
      page: () => const PredictionsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PredictionsController>(() => PredictionsController());
      }),
    ),
    GetPage(
      name: AppConstants.chatroomsRoute,
      page: () => const ChatroomsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatroomsController>(() => ChatroomsController());
      }),
    ),
    GetPage(
      name: AppConstants.profileRoute,
      page: () => const ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppConstants.leaderboardRoute,
      page: () => const LeaderboardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LeaderboardController>(() => LeaderboardController());
      }),
    ),
  ];
}
