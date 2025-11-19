import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/presentation/controllers/leaderboard_controller.dart';
import 'package:fanpulse/presentation/widgets/leaderboard_item.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: Column(
        children: [
          _buildLeaderboardTabs(controller),
          Expanded(
            child: Obx(
              () {
                switch (controller.selectedLeaderboardType.value) {
                  case 'global':
                    return _buildGlobalLeaderboard();
                  case 'club':
                    return _buildClubLeaderboard();
                  case 'friends':
                    return _buildFriendsLeaderboard();
                  default:
                    return _buildGlobalLeaderboard();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardTabs(LeaderboardController controller) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: _buildTab(
                controller: controller,
                label: 'Global',
                value: 'global',
                icon: Icons.public,
              ),
            ),
            Expanded(
              child: _buildTab(
                controller: controller,
                label: 'My Club',
                value: 'club',
                icon: Icons.shield,
              ),
            ),
            Expanded(
              child: _buildTab(
                controller: controller,
                label: 'Friends',
                value: 'friends',
                icon: Icons.people,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    required LeaderboardController controller,
    required String label,
    required String value,
    required IconData icon,
  }) {
    final bool isSelected = controller.selectedLeaderboardType.value == value;
    return GestureDetector(
      onTap: () => controller.changeLeaderboardType(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : AppTheme.textSecondary,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.black : AppTheme.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalLeaderboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryGreen, AppTheme.accentBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Global Rank',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '#47',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total Points',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2,450',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '🏆 Top Fans Worldwide',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const LeaderboardItem(
            rank: 1,
            userName: 'Football_King',
            team: 'Manchester City',
            points: 12580,
          ),
          const LeaderboardItem(
            rank: 2,
            userName: 'Goal_Master',
            team: 'Arsenal',
            points: 11950,
          ),
          const LeaderboardItem(
            rank: 3,
            userName: 'Fan_Legend',
            team: 'Liverpool',
            points: 11420,
          ),
          const LeaderboardItem(
            rank: 4,
            userName: 'Prediction_Pro',
            team: 'Chelsea',
            points: 10890,
          ),
          const LeaderboardItem(
            rank: 5,
            userName: 'Striker_Ace',
            team: 'Real Madrid',
            points: 10350,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.more_horiz, color: AppTheme.textSecondary),
              ],
            ),
          ),
          const LeaderboardItem(
            rank: 47,
            userName: 'You (John Doe)',
            team: 'Arsenal',
            points: 2450,
            isCurrentUser: true,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildClubLeaderboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.accentPurple, AppTheme.accentBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Arsenal Rank',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '#12',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Club Points',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2,450',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⚽ Top Arsenal Fans',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const LeaderboardItem(
            rank: 1,
            userName: 'Gunner_Legend',
            team: 'Arsenal',
            points: 8950,
          ),
          const LeaderboardItem(
            rank: 2,
            userName: 'North_London_Red',
            team: 'Arsenal',
            points: 8420,
          ),
          const LeaderboardItem(
            rank: 3,
            userName: 'COYG_Forever',
            team: 'Arsenal',
            points: 7890,
          ),
          const LeaderboardItem(
            rank: 4,
            userName: 'Arsenal_Warrior',
            team: 'Arsenal',
            points: 7350,
          ),
          const LeaderboardItem(
            rank: 5,
            userName: 'Emirates_Fan',
            team: 'Arsenal',
            points: 6820,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.more_horiz, color: AppTheme.textSecondary),
              ],
            ),
          ),
          const LeaderboardItem(
            rank: 12,
            userName: 'You (John Doe)',
            team: 'Arsenal',
            points: 2450,
            isCurrentUser: true,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFriendsLeaderboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.people_outline,
                  color: AppTheme.textSecondary,
                  size: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Add Friends',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Connect with friends to compete on the leaderboard',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Invite Friends'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '👥 Friend Suggestions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildFriendSuggestion('Sarah_FC', 'Mutual: 12 friends'),
          const SizedBox(height: 12),
          _buildFriendSuggestion('Mike_United', 'Mutual: 8 friends'),
          const SizedBox(height: 12),
          _buildFriendSuggestion('Emma_Blues', 'Mutual: 15 friends'),
        ],
      ),
    );
  }

  Widget _buildFriendSuggestion(String name, String mutualFriends) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name[0].toUpperCase(),
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mutualFriends,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minimumSize: const Size(0, 0),
            ),
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

