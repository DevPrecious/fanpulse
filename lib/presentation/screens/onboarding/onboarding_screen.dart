import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/constants/app_constants.dart';
import 'package:fanpulse/core/utils/responsive.dart';
import 'package:fanpulse/presentation/controllers/onboarding_controller.dart';
import 'package:fanpulse/presentation/widgets/custom_button.dart';
import 'package:fanpulse/presentation/widgets/responsive_screen.dart' as rw;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final PageController pageController = PageController();
    final responsive = context.responsive;

    return Scaffold(
      body: rw.ResponsiveWrapper(
        centerContent: true,
        maxWidth: 600,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(responsive.spacing16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => controller.currentPage.value > 0
                        ? TextButton(
                            onPressed: () {
                              controller.previousPage();
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Text(
                              'Back',
                              style: TextStyle(color: AppTheme.textSecondary),
                            ),
                          )
                        : const SizedBox(width: 60),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(AppConstants.loginRoute),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: controller.updatePage,
                children: const [
                  _OnboardingPage(
                    emoji: '⚽️',
                    title: 'Welcome to FanPulse',
                    description:
                        'Join millions of football fans worldwide. Predict matches, vote in polls, and compete on leaderboards.',
                  ),
                  _OnboardingPage(
                    emoji: '🏆',
                    title: 'Compete & Win',
                    description:
                        'Earn points for correct predictions. Climb the leaderboards and become a Legend in your fan community.',
                  ),
                  _OnboardingPage(
                    emoji: '💬',
                    title: 'Connect with Fans',
                    description:
                        'Chat with fans from your club and leagues. Share reactions during live matches and join the conversation.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(responsive.spacing24),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: responsive.spacing8 / 2),
                          width: controller.currentPage.value == index ? 32 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? AppTheme.primaryGreen
                                : AppTheme.textSecondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.spacing32),
                  Obx(
                    () => CustomButton(
                      text: controller.isLastPage() ? 'Get Started' : 'Next',
                      onPressed: () {
                        if (controller.isLastPage()) {
                          Get.toNamed(AppConstants.loginRoute);
                        } else {
                          controller.nextPage();
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: controller.isLastPage() ? Icons.arrow_forward : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.emoji,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final circleSize = responsive.isMobile ? 200.0 : (responsive.isTablet ? 240.0 : 280.0);
    
    return Padding(
      padding: EdgeInsets.all(responsive.spacing32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryGreen.withOpacity(0.2),
                  AppTheme.accentBlue.withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                emoji,
                style: TextStyle(fontSize: responsive.isMobile ? 100 : 120),
              ),
            ),
          ),
          SizedBox(height: responsive.spacing32 + 16),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: responsive.displayLarge,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsive.spacing16),
          Text(
            description,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: responsive.bodyLarge,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

