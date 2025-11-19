import 'package:flutter/material.dart';
import 'package:fanpulse/core/utils/responsive.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;
  final bool centerContent;
  final double? maxWidth;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.useSafeArea = true,
    this.centerContent = false,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    Widget content = child;
    
    // Center content for tablets and desktop
    if (centerContent && (responsive.isTablet || responsive.isDesktop)) {
      content = Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? responsive.maxContentWidth,
          ),
          child: content,
        ),
      );
    }
    
    // Apply safe area if needed
    if (useSafeArea) {
      content = SafeArea(child: content);
    }
    
    return content;
  }
}

// Responsive padding widget
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final bool horizontal;
  final bool vertical;

  const ResponsivePadding({
    super.key,
    required this.child,
    this.horizontal = true,
    this.vertical = true,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ? responsive.horizontalPadding : 0,
        vertical: vertical ? responsive.verticalPadding : 0,
      ),
      child: child,
    );
  }
}

// Responsive sized box
class ResponsiveSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const ResponsiveSizedBox({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return SizedBox(
      height: height != null ? responsive.getHeight(height!) : null,
      width: width != null ? responsive.getWidth(width!) : null,
      child: child,
    );
  }
}

// Extension for responsive helper methods
extension ResponsiveSizeExtension on Responsive {
  double getHeight(double size) {
    if (isMobile) {
      return size;
    } else if (isTablet) {
      return size * 1.15;
    } else {
      return size * 1.3;
    }
  }

  double getWidth(double size) {
    if (isMobile) {
      return size;
    } else if (isTablet) {
      return size * 1.15;
    } else {
      return size * 1.3;
    }
  }
}

