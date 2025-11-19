import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/presentation/controllers/predictions_controller.dart';
import 'package:fanpulse/presentation/widgets/custom_button.dart';

class PredictionsScreen extends StatelessWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PredictionsController controller = Get.put(PredictionsController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predictions & Challenges'),
      ),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: Obx(
              () => controller.selectedTab.value == 'upcoming'
                  ? _buildUpcomingTab(controller)
                  : _buildLeaderboardTab(controller),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(PredictionsController controller) {
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
              child: GestureDetector(
                onTap: () => controller.changeTab('upcoming'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 'upcoming'
                        ? AppTheme.primaryGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Upcoming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: controller.selectedTab.value == 'upcoming'
                          ? Colors.black
                          : AppTheme.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab('leaderboard'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 'leaderboard'
                        ? AppTheme.primaryGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Leaderboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: controller.selectedTab.value == 'leaderboard'
                          ? Colors.black
                          : AppTheme.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTab(PredictionsController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🎯 Make Your Predictions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Earn points for correct predictions and climb the leaderboard',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          _buildPredictionCard(
            controller: controller,
            matchId: 'match1',
            homeTeam: 'Manchester United',
            awayTeam: 'Liverpool',
            date: 'Today, 8:00 PM',
            league: 'Premier League',
            points: 50,
          ),
          const SizedBox(height: 16),
          _buildPredictionCard(
            controller: controller,
            matchId: 'match2',
            homeTeam: 'Barcelona',
            awayTeam: 'Real Madrid',
            date: 'Tomorrow, 6:00 PM',
            league: 'La Liga',
            points: 75,
          ),
          const SizedBox(height: 16),
          _buildPredictionCard(
            controller: controller,
            matchId: 'match3',
            homeTeam: 'Bayern Munich',
            awayTeam: 'Borussia Dortmund',
            date: 'Saturday, 5:30 PM',
            league: 'Bundesliga',
            points: 60,
          ),
          const SizedBox(height: 16),
          _buildPredictionCard(
            controller: controller,
            matchId: 'match4',
            homeTeam: 'PSG',
            awayTeam: 'Marseille',
            date: 'Sunday, 9:00 PM',
            league: 'Ligue 1',
            points: 55,
          ),
        ],
      ),
    );
  }

  Widget _buildPredictionCard({
    required PredictionsController controller,
    required String matchId,
    required String homeTeam,
    required String awayTeam,
    required String date,
    required String league,
    required int points,
  }) {
    return Obx(() {
      final bool hasPredicted = controller.hasPredicted(matchId);
      final prediction = controller.predictions[matchId];
      
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: hasPredicted
              ? Border.all(color: AppTheme.primaryGreen, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.accentBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    league,
                    style: const TextStyle(
                      color: AppTheme.accentBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.stars, color: AppTheme.primaryGreen, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '+$points pts',
                      style: const TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.darkBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.textSecondary.withOpacity(0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            homeTeam.substring(0, 3).toUpperCase(),
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        homeTeam,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.darkBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.textSecondary.withOpacity(0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            awayTeam.substring(0, 3).toUpperCase(),
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        awayTeam,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: AppTheme.textSecondary),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (!hasPredicted)
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Home Win',
                      onPressed: () => controller.makePrediction(matchId, 'home'),
                      isSmall: true,
                      backgroundColor: AppTheme.primaryGreen.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomButton(
                      text: 'Draw',
                      onPressed: () => controller.makePrediction(matchId, 'draw'),
                      isSmall: true,
                      backgroundColor: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomButton(
                      text: 'Away Win',
                      onPressed: () => controller.makePrediction(matchId, 'away'),
                      isSmall: true,
                      backgroundColor: AppTheme.accentBlue,
                    ),
                  ),
                ],
              )
            else
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.primaryGreen, width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: AppTheme.primaryGreen, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Prediction Submitted',
                            style: TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your pick: ${_getPredictionText(prediction?['prediction'])}',
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 13,
                            ),
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
    });
  }

  String _getPredictionText(String? prediction) {
    switch (prediction) {
      case 'home':
        return 'Home Win';
      case 'draw':
        return 'Draw';
      case 'away':
        return 'Away Win';
      default:
        return 'Unknown';
    }
  }

  Widget _buildLeaderboardTab(PredictionsController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
                      'Your Rank',
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
                        fontSize: 32,
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
                        fontSize: 32,
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
            '🏆 Top Predictors',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildLeaderboardItem(1, 'Football_King', '8,950', true),
          const SizedBox(height: 12),
          _buildLeaderboardItem(2, 'Prediction_Pro', '8,720', false),
          const SizedBox(height: 12),
          _buildLeaderboardItem(3, 'Goal_Master', '8,450', false),
          const SizedBox(height: 12),
          _buildLeaderboardItem(4, 'Striker_Ace', '7,890', false),
          const SizedBox(height: 12),
          _buildLeaderboardItem(5, 'Fan_Legend', '7,650', false),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String points, bool isGold) {
    String emoji = '';
    if (rank == 1) {
      emoji = '🥇';
    } else if (rank == 2) {
      emoji = '🥈';
    } else if (rank == 3) {
      emoji = '🥉';
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: isGold
            ? Border.all(color: const Color(0xFFFFD700), width: 2)
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.darkBackground,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                emoji.isNotEmpty ? emoji : '#$rank',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: emoji.isNotEmpty ? 24 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: const TextStyle(
                  color: AppTheme.primaryGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'points',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

