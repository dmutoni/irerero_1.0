import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/assets/character_assets.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseCharacterScreen extends ConsumerStatefulWidget {
  const ChooseCharacterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseCharacterScreenState();
}

class _ChooseCharacterScreenState extends ConsumerState<ChooseCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.marginTopOfTheScreen,
          left: Dimens.marginMedium,
          right: Dimens.marginMedium,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: Dimens.marginSeventy,
                ),
                child: Text(
                  'Choose a Character',
                  style: TextStyle(
                    fontFamily: 'Coiny',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryAccent, // Stroke color
                    shadows: [
                      Shadow(
                        blurRadius: 0.2,
                        color: ThemeColors.primaryColor,
                        offset: Offset(1,
                            1), // Adjust this offset to control the stroke width
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimens.marginLarge),
              SvgPicture.asset(
                CharacterAssets.hyena,
                // width: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
