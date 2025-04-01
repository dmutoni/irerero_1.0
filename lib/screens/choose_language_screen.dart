import 'package:flutter/material.dart';
import 'package:flutter_starter_template/classes/languages.dart';
import 'package:flutter_starter_template/data/providers/languages/language_provider.dart';
import 'package:flutter_starter_template/helpers/config.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseLanguageScreen extends ConsumerStatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends ConsumerState<ChooseLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    Language? selectedLanguage = ref.watch(languageProvider).selectedLanguage;

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
                  'Choose Language',
                  style: Styles.chooseCharacterHeaderTitle,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                ),
                itemCount: Language.languageList().length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(languageProvider.notifier).selectLanguage(
                            Language.languageList()[index],
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              selectedLanguage == Language.languageList()[index]
                                  ? ThemeColors.orangePrimaryColor
                                  : Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            Language.languageList()[index].flag ?? '',
                            width: 150,
                          ),
                          Text(
                            Language.languageList()[index].name!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              AppButton(
                title: 'Get started',
                isEnabled: selectedLanguage != null,
                onTap: () {
                  context.go(
                    AppRoutes.numbersScreenRouteName,
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
