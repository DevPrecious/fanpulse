import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/presentation/controllers/polls_controller.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PollsController controller = Get.put(PollsController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fan Polls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🗳️ Vote & Share Your Opinion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Join thousands of fans in voting on the hottest football debates',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            _buildPollCard(
              controller: controller,
              pollId: 'poll1',
              question: "Who's better: Mbappé or Haaland?",
              options: [
                {'id': 'option1', 'text': 'Kylian Mbappé', 'votes': 6250},
                {'id': 'option2', 'text': 'Erling Haaland', 'votes': 6250},
              ],
              totalVotes: 12500,
              timeLeft: '2 days left',
            ),
            const SizedBox(height: 16),
            _buildPollCard(
              controller: controller,
              pollId: 'poll2',
              question: "Should Manchester United change coach?",
              options: [
                {'id': 'option1', 'text': 'Yes, immediately', 'votes': 5810},
                {'id': 'option2', 'text': 'No, give him time', 'votes': 1490},
                {'id': 'option3', 'text': 'Wait until season end', 'votes': 1000},
              ],
              totalVotes: 8300,
              timeLeft: '5 days left',
            ),
            const SizedBox(height: 16),
            _buildPollCard(
              controller: controller,
              pollId: 'poll3',
              question: "Which team will win the Champions League?",
              options: [
                {'id': 'option1', 'text': 'Manchester City', 'votes': 3200},
                {'id': 'option2', 'text': 'Real Madrid', 'votes': 2800},
                {'id': 'option3', 'text': 'Bayern Munich', 'votes': 1500},
                {'id': 'option4', 'text': 'Barcelona', 'votes': 2500},
              ],
              totalVotes: 10000,
              timeLeft: '1 week left',
            ),
            const SizedBox(height: 16),
            _buildPollCard(
              controller: controller,
              pollId: 'poll4',
              question: "Best Premier League signing this season?",
              options: [
                {'id': 'option1', 'text': 'Rice to Arsenal', 'votes': 4500},
                {'id': 'option2', 'text': 'Caicedo to Chelsea', 'votes': 2000},
                {'id': 'option3', 'text': 'Szoboszlai to Liverpool', 'votes': 3500},
              ],
              totalVotes: 10000,
              timeLeft: '3 days left',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPollCard({
    required PollsController controller,
    required String pollId,
    required String question,
    required List<Map<String, dynamic>> options,
    required int totalVotes,
    required String timeLeft,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '📊 Poll',
                style: TextStyle(
                  color: AppTheme.accentBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.warningOrange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  timeLeft,
                  style: const TextStyle(
                    color: AppTheme.warningOrange,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            question,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            final bool hasVoted = controller.hasVotedForPoll(pollId);
            return Column(
              children: options.map((option) {
                final bool isSelected = controller.selectedPollOptions[pollId] == option['id'];
                final double percentage = (option['votes'] as int) / totalVotes;
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      if (!hasVoted) {
                        controller.selectPollOption(pollId, option['id']);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: hasVoted
                            ? (isSelected
                                ? AppTheme.primaryGreen.withOpacity(0.2)
                                : AppTheme.darkBackground)
                            : AppTheme.darkBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected && hasVoted
                              ? AppTheme.primaryGreen
                              : AppTheme.textSecondary.withOpacity(0.3),
                          width: isSelected && hasVoted ? 2 : 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (hasVoted)
                            Positioned.fill(
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: percentage,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryGreen.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          Row(
                            children: [
                              if (isSelected && hasVoted)
                                const Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppTheme.primaryGreen,
                                    size: 24,
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  option['text'],
                                  style: TextStyle(
                                    color: isSelected && hasVoted
                                        ? AppTheme.primaryGreen
                                        : AppTheme.textPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              if (hasVoted)
                                Text(
                                  '${(percentage * 100).toStringAsFixed(1)}%',
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppTheme.primaryGreen
                                        : AppTheme.textSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${totalVotes.toString()} votes',
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.people_outline,
                    color: AppTheme.textSecondary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${(totalVotes * 1.5).toInt()} views',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

