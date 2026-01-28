import 'package:flutter/material.dart';

enum AppTheme { light, dark, system }

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;

  AppTheme get currentTheme => _currentTheme;

  bool get isDarkMode {
    if (_currentTheme == AppTheme.system) {
      return false;
    }
    return _currentTheme == AppTheme.dark;
  }

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
