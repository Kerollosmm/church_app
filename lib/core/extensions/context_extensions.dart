import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  /// Easy access to Theme
  ThemeData get theme => Theme.of(this);

  /// Easy access to ColorScheme
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Easy access to TextTheme
  TextTheme get typography => Theme.of(this).textTheme;

  /// Check if dark mode is enabled
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Get screen width
  double get width => MediaQuery.of(this).size.width;

  /// Get screen height
  double get height => MediaQuery.of(this).size.height;
}
