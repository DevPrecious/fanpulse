import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  // Screen dimensions
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  // Device types
  bool get isMobile => width < 650;
  bool get isTablet => width >= 650 && width < 1100;
  bool get isDesktop => width >= 1100;

  // Orientation
  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(context).orientation == Orientation.landscape;

  // Responsive values
  double get horizontalPadding => isMobile ? 16.0 : (isTablet ? 24.0 : 32.0);
  double get verticalPadding => isMobile ? 16.0 : (isTablet ? 20.0 : 24.0);

  // Font sizes
  double get displayLarge => isMobile ? 32.0 : (isTablet ? 36.0 : 40.0);
  double get displayMedium => isMobile ? 28.0 : (isTablet ? 32.0 : 36.0);
  double get displaySmall => isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
  double get headlineMedium => isMobile ? 20.0 : (isTablet ? 22.0 : 24.0);
  double get titleLarge => isMobile ? 18.0 : (isTablet ? 20.0 : 22.0);
  double get bodyLarge => isMobile ? 16.0 : (isTablet ? 17.0 : 18.0);
  double get bodyMedium => isMobile ? 14.0 : (isTablet ? 15.0 : 16.0);

  // Component sizes
  double get iconSize => isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
  double get avatarSize => isMobile ? 60.0 : (isTablet ? 80.0 : 100.0);
  double get buttonHeight => isMobile ? 52.0 : (isTablet ? 56.0 : 60.0);
  double get cardBorderRadius => isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);

  // Grid columns
  int get gridColumns => isMobile ? 2 : (isTablet ? 3 : 4);
  
  // Max width for content
  double get maxContentWidth => isDesktop ? 1200.0 : double.infinity;

  // Spacing
  double get spacing8 => isMobile ? 8.0 : (isTablet ? 10.0 : 12.0);
  double get spacing12 => isMobile ? 12.0 : (isTablet ? 14.0 : 16.0);
  double get spacing16 => isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
  double get spacing24 => isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
  double get spacing32 => isMobile ? 32.0 : (isTablet ? 40.0 : 48.0);

  // Responsive value based on device type
  T valueByDevice<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) {
      return desktop;
    }
    if (isTablet && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  // Responsive spacing
  EdgeInsets get pagePadding => EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      );

  // Responsive card padding
  EdgeInsets get cardPadding => EdgeInsets.all(
        isMobile ? 16.0 : (isTablet ? 20.0 : 24.0),
      );
}

// Extension for easy access
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}

// Responsive widget builder
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Responsive responsive) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, Responsive(context));
  }
}

// Responsive layout
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    if (responsive.isDesktop && desktop != null) {
      return desktop!;
    }
    if (responsive.isTablet && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}

