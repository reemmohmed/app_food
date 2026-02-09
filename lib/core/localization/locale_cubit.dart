import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  static const String _localeKey = 'app_locale_code';

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_localeKey);

    if (savedCode != null && savedCode.isNotEmpty) {
      emit(Locale(_normalizeToSupported(savedCode)));
      return;
    }

    final deviceLocale = PlatformDispatcher.instance.locale;
    final languageCode = _normalizeToSupported(deviceLocale.languageCode);

    await prefs.setString(_localeKey, languageCode);
    emit(Locale(languageCode));
  }

  Future<void> changeLocale(String languageCode) async {
    final normalized = _normalizeToSupported(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, normalized);
    emit(Locale(normalized));
  }

  String _normalizeToSupported(String code) {
    if (code.startsWith('ar')) return 'ar';
    if (code.startsWith('de')) return 'de';
    return 'en';
  }
}
