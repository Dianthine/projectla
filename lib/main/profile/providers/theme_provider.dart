import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String _theme = 'System Default';

  String get theme => _theme;

  set theme(String theme) {
    _theme = theme;
    notifyListeners();
  }

  ThemeData get currentTheme {
    switch (_theme) {
      case 'Light':
        return ThemeData.light();
      case 'Dark':
        return ThemeData.dark();
      default:
        return ThemeData.fallback();
    }
  }
}
