import 'package:flutter/material.dart';
import 'package:flutter_starter_template/data/providers/characters/character_provider.dart';
import 'package:flutter_starter_template/helpers/config.dart';
import 'package:flutter_starter_template/screens/configurations/character_name_config.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
    Character? selectedCharacter =
        ref.watch(characterProvider).selectedCharacter;

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
                  style: Styles.chooseCharacterHeaderTitle,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.only(
                  top: Dimens.marginMiddle,
                ),
                itemCount:
                    Character.values.length, // Total number of characters
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(characterProvider.notifier).selectCharacter(
                            Character.values[index],
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCharacter == Character.values[index]
                              ? ThemeColors.orangePrimaryColor
                              : Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Character.values[index].asset,
                            width: 100, // Adjust width as needed
                            height: 100, // Adjust height as needed
                          ),
                          Text(
                            Character.values[index].name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: Dimens.marginSmall,
              ), // Adjust height as needed
              AppButton(
                title: 'Get started',
                isEnabled: selectedCharacter != null,
                onTap: () {
                  context.go(
                    AppRoutes.chooseLanguageScreenRouteName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
