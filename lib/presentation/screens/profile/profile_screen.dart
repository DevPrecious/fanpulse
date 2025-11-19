import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/presentation/controllers/profile_controller.dart';
import 'package:fanpulse/presentation/widgets/stat_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(controller),
            const SizedBox(height: 24),
            _buildStatsSection(controller),
            const SizedBox(height: 24),
            _buildBadgesSection(controller),
            const SizedBox(height: 24),
            _buildRecentActivity(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ProfileController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentPurple.withOpacity(0.3),
            AppTheme.accentBlue.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryGreen, width: 3),
            ),
            child: const Center(
              child: Text(
                'JD',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Text(
              controller.userName.value,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '⚽ ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  controller.favoriteClub.value,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.primaryGreen, width: 2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.military_tech,
                    color: AppTheme.primaryGreen,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    controller.fanRank.value,
                    style: const TextStyle(
                      color: AppTheme.primaryGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(ProfileController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 Your Stats',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Total Points',
                    value: controller.totalPoints.value.toString(),
                    icon: Icons.stars,
                    iconColor: AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: StatCard(
                    title: 'Predictions',
                    value: '127',
                    icon: Icons.casino,
                    iconColor: AppTheme.accentBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Win Rate',
                  value: '68%',
                  icon: Icons.trending_up,
                  iconColor: AppTheme.successGreen,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Polls Voted',
                  value: '89',
                  icon: Icons.poll,
                  iconColor: AppTheme.warningOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection(ProfileController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🏅 Badges Earned',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Obx(
                  () => Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildBadgeItem(
                        emoji: '🎯',
                        title: 'Top Predictor',
                        subtitle: 'Week 12',
                        isEarned: controller.badges.contains('🎯'),
                      ),
                      _buildBadgeItem(
                        emoji: '⚽',
                        title: 'Club Loyalist',
                        subtitle: '50 matches',
                        isEarned: controller.badges.contains('⚽'),
                      ),
                      _buildBadgeItem(
                        emoji: '🔥',
                        title: 'Hot Commenter',
                        subtitle: '100 comments',
                        isEarned: controller.badges.contains('🔥'),
                      ),
                      _buildBadgeItem(
                        emoji: '👑',
                        title: 'Legend',
                        subtitle: 'Coming soon',
                        isEarned: false,
                      ),
                      _buildBadgeItem(
                        emoji: '💯',
                        title: 'Perfect Week',
                        subtitle: 'Coming soon',
                        isEarned: false,
                      ),
                      _buildBadgeItem(
                        emoji: '🎖️',
                        title: 'Veteran',
                        subtitle: 'Coming soon',
                        isEarned: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem({
    required String emoji,
    required String title,
    required String subtitle,
    required bool isEarned,
  }) {
    return Opacity(
      opacity: isEarned ? 1.0 : 0.4,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isEarned
                  ? AppTheme.primaryGreen.withOpacity(0.2)
                  : AppTheme.darkBackground,
              shape: BoxShape.circle,
              border: Border.all(
                color: isEarned
                    ? AppTheme.primaryGreen
                    : AppTheme.textSecondary.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: isEarned ? AppTheme.textPrimary : AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📅 Recent Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildActivityItem(
            icon: Icons.casino,
            title: 'Predicted Arsenal vs Chelsea',
            subtitle: '2 hours ago',
            color: AppTheme.accentBlue,
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.poll,
            title: 'Voted in "Best Player" poll',
            subtitle: '5 hours ago',
            color: AppTheme.primaryGreen,
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.chat_bubble,
            title: 'Commented in Arsenal Fans',
            subtitle: 'Yesterday',
            color: AppTheme.warningOrange,
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.stars,
            title: 'Earned 50 points',
            subtitle: '2 days ago',
            color: AppTheme.accentPurple,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

