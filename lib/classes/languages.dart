import 'package:flutter_starter_template/values/assets/language_assets.dart';

class Language {
  final int? id;
  final String? name;
  final String? flag;
  final String? languageCode;

  const Language({
    required this.id,
    required this.name,
    required this.flag,
    required this.languageCode,
  });

  static List<Language> languageList() {
    return <Language>[
      const Language(
        id: 1,
        name: 'Kinyarwanda',
        flag: LanguageAssets.kinyarwanda,
        languageCode: 'rw',
      ),
      const Language(
        id: 2,
        name: 'English',
        flag: LanguageAssets.english,
        languageCode: 'en',
      ),
      const Language(
        id: 3,
        name: 'French',
        flag: LanguageAssets.french,
        languageCode: 'fr',
      ),
    ];
  }
}
