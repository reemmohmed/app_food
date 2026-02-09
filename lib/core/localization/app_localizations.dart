import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
    Locale('de'),
  ];

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'AppFood',
      'hello': 'Hello',
      'language_sheet_title': 'Choose language',
      'language_ar': 'Arabic',
      'language_en': 'English',
      'language_de': 'German',

      // Profile
      'profile_name': 'Name',
      'profile_email': 'Email',
      'profile_address': 'Delivery Address',
      'profile_password': 'Password',
      'profile_debit_card': 'Debit card',
      'profile_edit': 'Edit',
      'profile_logout': 'Log out',
      'profile_updated': 'Profile updated successfully',
    },
    'ar': {
      'app_title': 'تطبيق الأكل',
      'hello': 'مرحباً',
      'language_sheet_title': 'اختر اللغة',
      'language_ar': 'العربية',
      'language_en': 'الإنجليزية',
      'language_de': 'الألمانية',

      // Profile
      'profile_name': 'الاسم',
      'profile_email': 'البريد الإلكتروني',
      'profile_address': 'عنوان التوصيل',
      'profile_password': 'كلمة المرور',
      'profile_debit_card': 'بطاقة بنكية',
      'profile_edit': 'تعديل',
      'profile_logout': 'تسجيل الخروج',
      'profile_updated': 'تم تحديث الحساب بنجاح',
    },
    'de': {
      'app_title': 'AppFood',
      'hello': 'Hallo',
      'language_sheet_title': 'Sprache wählen',
      'language_ar': 'Arabisch',
      'language_en': 'Englisch',
      'language_de': 'Deutsch',

      // Profile
      'profile_name': 'Name',
      'profile_email': 'E-Mail',
      'profile_address': 'Lieferadresse',
      'profile_password': 'Passwort',
      'profile_debit_card': 'Debitkarte',
      'profile_edit': 'Bearbeiten',
      'profile_logout': 'Abmelden',
      'profile_updated': 'Profil wurde aktualisiert',
    },
  };

  String tr(String key) {
    final langCode = locale.languageCode;
    final Map<String, String> langMap =
        _localizedValues[langCode] ?? _localizedValues['en']!;
    return langMap[key] ?? _localizedValues['en']![key] ?? key;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'de'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
