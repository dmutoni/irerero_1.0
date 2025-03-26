import 'package:flutter_starter_template/values/assets/language_assets.dart';

enum Language {
  english,
  french,
  kinyarwanda,
}

extension LanguageName on Language {
  String get name {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.french:
        return 'French';
      case Language.kinyarwanda:
        return 'Kinyarwanda';
      default:
        return '';
    }
  }
}

extension LanguageAsset on Language {
  String get asset {
    switch (this) {
      case Language.english:
        return LanguageAssets.english;
      case Language.french:
        return LanguageAssets.french;
      case Language.kinyarwanda:
        return LanguageAssets.kinyarwanda;
      default:
        return '';
    }
  }
}
