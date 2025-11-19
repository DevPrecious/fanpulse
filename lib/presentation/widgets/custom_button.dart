import 'package:flutter/material.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/utils/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isSmall;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isSmall = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final buttonHeight = isSmall ? 40.0 : responsive.buttonHeight;
    final buttonPadding = isSmall
        ? EdgeInsets.symmetric(horizontal: responsive.spacing12, vertical: 8)
        : EdgeInsets.symmetric(horizontal: responsive.spacing24, vertical: responsive.spacing16);
    final fontSize = isSmall ? responsive.bodyMedium : responsive.bodyLarge;
    final bgColor = backgroundColor ?? AppTheme.primaryGreen;
    final fgColor = textColor ?? Colors.black;

    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: bgColor,
          side: BorderSide(color: bgColor, width: 2),
          padding: buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: Size.fromHeight(buttonHeight),
        ),
        child: _buildButtonContent(fontSize, bgColor),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        minimumSize: Size.fromHeight(buttonHeight),
      ),
      child: _buildButtonContent(fontSize, fgColor),
    );
  }

  Widget _buildButtonContent(double fontSize, Color color) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: fontSize + 4),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

