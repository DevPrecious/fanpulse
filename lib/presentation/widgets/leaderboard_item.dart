import 'package:flutter/material.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/utils/responsive.dart';

class LeaderboardItem extends StatelessWidget {
  final int rank;
  final String userName;
  final String team;
  final int points;
  final bool isCurrentUser;

  const LeaderboardItem({
    super.key,
    required this.rank,
    required this.userName,
    required this.team,
    required this.points,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return Container(
      margin: EdgeInsets.only(bottom: responsive.spacing12),
      padding: EdgeInsets.all(responsive.spacing16),
      decoration: BoxDecoration(
        color: isCurrentUser 
            ? AppTheme.primaryGreen.withOpacity(0.1)
            : AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: isCurrentUser
            ? Border.all(color: AppTheme.primaryGreen, width: 2)
            : null,
      ),
      child: Row(
        children: [
          _buildRankBadge(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  team,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points.toString(),
                style: const TextStyle(
                  color: AppTheme.primaryGreen,
                  fontSize: 20,
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

  Widget _buildRankBadge() {
    Color badgeColor;
    String rankText = rank.toString();
    if (rank == 1) {
      badgeColor = const Color(0xFFFFD700);
      rankText = '🥇';
    } else if (rank == 2) {
      badgeColor = const Color(0xFFC0C0C0);
      rankText = '🥈';
    } else if (rank == 3) {
      badgeColor = const Color(0xFFCD7F32);
      rankText = '🥉';
    } else {
      badgeColor = AppTheme.textSecondary;
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          rank <= 3 ? rankText : '#$rankText',
          style: TextStyle(
            color: rank <= 3 ? Colors.white : badgeColor,
            fontSize: rank <= 3 ? 24 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

