import 'package:flutter/material.dart';

class AppStyles {
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 16.0;
  static const double buttonBorderRadius = 12.0;
  
  static const EdgeInsets screenPadding = EdgeInsets.all(defaultPadding);
  static const EdgeInsets cardPadding = EdgeInsets.all(defaultPadding);
  
  static final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(cardBorderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
}

class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF64B5F6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color text = Color(0xFF333333);
  static const Color textLight = Color(0xFF666666);
}