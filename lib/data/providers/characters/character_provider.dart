import 'package:flutter_starter_template/screens/configurations/character_name_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _CharacterState {
  final Character? selectedCharacter;

  const _CharacterState({
    this.selectedCharacter,
  });

  _CharacterState copyWith({
    Character? selectedCharacter,
  }) {
    return _CharacterState(
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
    );
  }
}

class _CharacterNotifier extends StateNotifier<_CharacterState> {
  _CharacterNotifier() : super(const _CharacterState());

  void selectCharacter(Character character) {
    state = state.copyWith(selectedCharacter: character);
  }
}

final characterProvider =
    StateNotifierProvider<_CharacterNotifier, _CharacterState>(
  (ref) => _CharacterNotifier(),
);
