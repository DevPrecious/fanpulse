import 'package:flutter/material.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/utils/responsive.dart';

class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String homeScore;
  final String awayScore;
  final String matchTime;
  final bool isLive;
  final VoidCallback? onTap;

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.matchTime,
    this.isLive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(responsive.spacing16),
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(responsive.cardBorderRadius),
          border: isLive
              ? Border.all(color: AppTheme.primaryGreen, width: 2)
              : null,
        ),
        child: Column(
          children: [
            if (isLive)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'LIVE',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            else
              Text(
                matchTime,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _buildTeamSection(homeTeam, homeScore, true),
                ),
                const Text(
                  'VS',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: _buildTeamSection(awayTeam, awayScore, false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection(String team, String score, bool isHome) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = context.responsive;
        final teamCircleSize = responsive.isMobile ? 60.0 : (responsive.isTablet ? 70.0 : 80.0);
        return Column(
          children: [
            Container(
              width: teamCircleSize,
              height: teamCircleSize,
          decoration: BoxDecoration(
            color: AppTheme.darkBackground,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.textSecondary.withOpacity(0.3)),
          ),
              child: Center(
                child: Text(
                  team.substring(0, 3).toUpperCase(),
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: responsive.bodyLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.spacing8),
            Text(
              team,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: responsive.bodyMedium,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.spacing8 / 2),
            Text(
              score,
              style: TextStyle(
                color: AppTheme.primaryGreen,
                fontSize: responsive.displaySmall,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}

