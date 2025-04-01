import 'package:flutter_starter_template/classes/languages.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _LanguageState {
  final Language? selectedLanguage;

  const _LanguageState({
    this.selectedLanguage,
  });

  _LanguageState copyWith({
    Language? selectedLanguage,
  }) {
    return _LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

class _LanguageNotifier extends StateNotifier<_LanguageState> {
  _LanguageNotifier() : super(const _LanguageState());

  void selectLanguage(Language language) {
    state = state.copyWith(selectedLanguage: language);
  }
}

final languageProvider =
    StateNotifierProvider<_LanguageNotifier, _LanguageState>(
  (ref) => _LanguageNotifier(),
);
