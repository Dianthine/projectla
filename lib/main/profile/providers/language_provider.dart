import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = 'English';

  String get language => _language;

  set language(String language) {
    _language = language;
    notifyListeners();
  }

  Locale get currentLocale {
    switch (_language) {
      case 'Indonesian':
        return Locale('id', 'ID');
      case 'Spanish':
        return Locale('es', 'ES');
      default:
        return Locale('en', 'US');
    }
  }
}
