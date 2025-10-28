import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class AppThemeState extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
}

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());
