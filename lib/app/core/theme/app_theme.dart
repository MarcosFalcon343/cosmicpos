import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF003459);

class AppTheme {
  final bool darkMode;

  AppTheme({this.darkMode = false});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _customColor,
      brightness: (darkMode) ? Brightness.dark : Brightness.light,
    );
  }
}
