import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/constants/app_constants.dart';
import 'package:fanpulse/presentation/controllers/live_match_controller.dart';

class LiveMatchScreen extends StatelessWidget {
  const LiveMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveMatchController controller = Get.put(LiveMatchController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Match'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, size: 8, color: AppTheme.primaryGreen),
                SizedBox(width: 6),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: AppTheme.primaryGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildScoreSection(),
            const SizedBox(height: 24),
            _buildMatchStats(),
            const SizedBox(height: 24),
            _buildManOfTheMatchSection(controller),
            const SizedBox(height: 24),
            _buildPredictNextEventSection(controller),
            const SizedBox(height: 24),
            _buildLiveReactionsSection(controller),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryGreen.withOpacity(0.2),
            AppTheme.accentBlue.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Premier League',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTeamScore('Arsenal', 'ARS', '2'),
              Column(
                children: [
                  const Text(
                    "75'",
                    style: TextStyle(
                      color: AppTheme.primaryGreen,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.warningOrange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '2nd Half',
                      style: TextStyle(
                        color: AppTheme.warningOrange,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              _buildTeamScore('Chelsea', 'CHE', '1'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamScore(String team, String abbr, String score) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3), width: 2),
          ),
          child: Center(
            child: Text(
              abbr,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          team,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          score,
          style: const TextStyle(
            color: AppTheme.primaryGreen,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMatchStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 Match Statistics',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildStatBar('Possession', '58', '42', AppTheme.primaryGreen),
          const SizedBox(height: 16),
          _buildStatBar('Shots', '12', '8', AppTheme.accentBlue),
          const SizedBox(height: 16),
          _buildStatBar('Shots on Target', '6', '4', AppTheme.warningOrange),
          const SizedBox(height: 16),
          _buildStatBar('Corners', '7', '3', AppTheme.accentPurple),
        ],
      ),
    );
  }

  Widget _buildStatBar(String label, String homeValue, String awayValue, Color color) {
    final int homeInt = int.parse(homeValue);
    final int awayInt = int.parse(awayValue);
    final int total = homeInt + awayInt;
    final double homePercentage = homeInt / total;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              homeValue,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
            Text(
              awayValue,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              Expanded(
                flex: (homePercentage * 100).toInt(),
                child: Container(
                  height: 8,
                  color: color,
                ),
              ),
              Expanded(
                flex: ((1 - homePercentage) * 100).toInt(),
                child: Container(
                  height: 8,
                  color: color.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildManOfTheMatchSection(LiveMatchController controller) {
    final List<Map<String, String>> players = [
      {'id': '1', 'name': 'Saka', 'team': 'Arsenal', 'number': '7'},
      {'id': '2', 'name': 'Ødegaard', 'team': 'Arsenal', 'number': '8'},
      {'id': '3', 'name': 'Palmer', 'team': 'Chelsea', 'number': '20'},
      {'id': '4', 'name': 'Jackson', 'team': 'Chelsea', 'number': '15'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                '⭐',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(width: 8),
              Text(
                'Man of the Match',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => Wrap(
              spacing: 12,
              runSpacing: 12,
              children: players.map((player) {
                final bool isSelected = controller.selectedManOfTheMatch.value == player['id'];
                return GestureDetector(
                  onTap: () => controller.selectManOfTheMatch(player['id']!),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primaryGreen.withOpacity(0.2)
                          : AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppTheme.primaryGreen : AppTheme.textSecondary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isSelected)
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.check_circle, color: AppTheme.primaryGreen, size: 20),
                          ),
                        Text(
                          '${player['number']} ${player['name']}',
                          style: TextStyle(
                            color: isSelected ? AppTheme.primaryGreen : AppTheme.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPredictNextEventSection(LiveMatchController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                '🔮',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(width: 8),
              Text(
                'Predict Next Event',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => Wrap(
              spacing: 12,
              runSpacing: 12,
              children: AppConstants.matchEvents.map((event) {
                final bool isSelected = controller.selectedNextEvent.value == event;
                return GestureDetector(
                  onTap: () => controller.selectNextEvent(event),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.accentBlue.withOpacity(0.2)
                          : AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppTheme.accentBlue : AppTheme.textSecondary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      event,
                      style: TextStyle(
                        color: isSelected ? AppTheme.accentBlue : AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveReactionsSection(LiveMatchController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚡ Live Reactions',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Wrap(
              spacing: 16,
              runSpacing: 16,
              children: AppConstants.reactions.map((emoji) {
                final int count = controller.reactions[emoji] ?? 0;
                return GestureDetector(
                  onTap: () => controller.addReaction(emoji),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.textSecondary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                        if (count > 0) ...[
                          const SizedBox(height: 4),
                          Text(
                            count.toString(),
                            style: const TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

