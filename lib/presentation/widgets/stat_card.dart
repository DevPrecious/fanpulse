import 'package:flutter/material.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/utils/responsive.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return Container(
      padding: responsive.cardPadding,
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(responsive.cardBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(responsive.spacing8 + 2),
            decoration: BoxDecoration(
              color: (iconColor ?? AppTheme.primaryGreen).withOpacity(0.2),
              borderRadius: BorderRadius.circular(responsive.spacing12),
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppTheme.primaryGreen,
              size: responsive.iconSize,
            ),
          ),
          SizedBox(height: responsive.spacing12),
          Text(
            value,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: responsive.displaySmall,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: responsive.spacing8 / 2),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: responsive.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

