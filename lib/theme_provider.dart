import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeState extends ChangeNotifier {
  static const _themePreferenceKey = 'isDarkModeEnabled';

  bool isDarkModeEnabled = false;
  SharedPreferences? _preferences;

  AppThemeState() {
    _loadSavedTheme;
  }

  Future<void> _loadSavedTheme() async {
    final preferences = await SharedPreferences.getInstance();
    _preferences = preferences;

    isDarkModeEnabled =
        preferences.getBool(_themePreferenceKey) ?? isDarkModeEnabled;
    notifyListeners();
  }

  Future<void> _persistThemePreference(bool isDarkModeEnabled) async {
    final preferences = _preferences ??= await SharedPreferences.getInstance();
    await preferences.setBool(_themePreferenceKey, isDarkModeEnabled);
  }

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
    _persistThemePreference(false);
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
    _persistThemePreference(true);
  }
}

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());
