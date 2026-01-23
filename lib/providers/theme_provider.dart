import 'package:flutter/material.dart';

enum AppTheme { light, dark, system }

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;

  AppTheme get currentTheme => _currentTheme;

  // Check if dark mode is active
  bool get isDarkMode {
    if (_currentTheme == AppTheme.system) {
      // For system theme, you could check:
      // WidgetsBinding.instance.window.platformBrightness
      // But for simplicity, we'll default to light
      return false;
    }
    return _currentTheme == AppTheme.dark;
  }

  // Theme mode for MaterialApp
  ThemeMode get themeMode {
    switch (_currentTheme) {
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }

  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _currentTheme = _currentTheme == AppTheme.light
        ? AppTheme.dark
        : AppTheme.light;
    notifyListeners();
  }
}
