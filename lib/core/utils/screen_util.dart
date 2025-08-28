import 'package:flutter/material.dart';

class ScreenUtil {
  static bool get isTablet {
    final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    final screenWidth = data.size.shortestSide;
    return screenWidth > 600; // Typical tablet breakpoint
  }
}
