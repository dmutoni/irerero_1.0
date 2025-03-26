import 'package:flutter_starter_template/values/assets/character_assets.dart';

enum Character {
  hyena,
  pinguine,
  lion,
  cat,
  donkey,
  crocodile,
}

// getter for the character name
extension CharacterName on Character {
  String get name {
    switch (this) {
      case Character.hyena:
        return 'Hyena';
      case Character.lion:
        return 'Lion';
      case Character.donkey:
        return 'Donkey';
      case Character.crocodile:
        return 'Crocodile';
      case Character.pinguine:
        return 'Pinguine';
      case Character.cat:
        return 'Cat';
      default:
        return '';
    }
  }
}

// getter for the character asset
extension CharacterAsset on Character {
  String get asset {
    switch (this) {
      case Character.hyena:
        return CharacterAssets.hyena;
      case Character.lion:
        return CharacterAssets.lion;
      case Character.donkey:
        return CharacterAssets.donkey;
      case Character.crocodile:
        return CharacterAssets.crocodile;
      case Character.pinguine:
        return CharacterAssets.pinguine;
      case Character.cat:
        return CharacterAssets.cat;
      default:
        return '';
    }
  }
}
