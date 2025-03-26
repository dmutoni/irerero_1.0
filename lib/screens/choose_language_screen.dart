import 'package:flutter/material.dart';
import 'package:flutter_starter_template/classes/languages.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_svg/svg.dart';
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.only(
                  top: Dimens.marginMiddle,
                ),
                itemCount: Language.languageList()
                    .length, // Total number of characters
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Language.languageList()[index].flag!,
                        ),
                        Text(
                          Language.languageList()[index].name!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
              AppButton(
                title: 'Get started',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
