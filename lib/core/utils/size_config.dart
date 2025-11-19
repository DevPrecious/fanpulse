import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double textScaleFactor;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    
    final double safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    final double safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    
    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;
    
    textScaleFactor = _mediaQueryData.textScaleFactor;
  }

  // Responsive width
  static double getWidth(double percentage) {
    return blockSizeHorizontal * percentage;
  }

  // Responsive height
  static double getHeight(double percentage) {
    return blockSizeVertical * percentage;
  }

  // Safe area width
  static double getSafeWidth(double percentage) {
    return safeBlockHorizontal * percentage;
  }

  // Safe area height
  static double getSafeHeight(double percentage) {
    return safeBlockVertical * percentage;
  }

  // Responsive font size
  static double getFontSize(double size) {
    if (screenWidth < 375) {
      return size * 0.9;
    } else if (screenWidth >= 375 && screenWidth < 768) {
      return size;
    } else if (screenWidth >= 768 && screenWidth < 1024) {
      return size * 1.1;
    } else {
      return size * 1.2;
    }
  }

  // Responsive spacing
  static double getSpacing(double size) {
    if (screenWidth < 375) {
      return size * 0.9;
    } else if (screenWidth >= 375 && screenWidth < 768) {
      return size;
    } else if (screenWidth >= 768 && screenWidth < 1024) {
      return size * 1.15;
    } else {
      return size * 1.3;
    }
  }

  // Device type helpers
  static bool get isMobileSmall => screenWidth < 375;
  static bool get isMobile => screenWidth >= 375 && screenWidth < 768;
  static bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
  static bool get isDesktop => screenWidth >= 1024;
  
  // Orientation
  static bool get isPortrait => screenHeight > screenWidth;
  static bool get isLandscape => screenWidth > screenHeight;
}

