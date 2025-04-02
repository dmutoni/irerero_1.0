import 'package:flutter/material.dart';
import 'package:flutter_starter_template/language_constants.dart';
import 'package:flutter_starter_template/localisations/cupertino_localisations_rw.dart';
import 'package:flutter_starter_template/localisations/material_localisations_rw.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/signup_screen.dart';
import 'package:flutter_starter_template/screens/choose_character_screen.dart';
import 'package:flutter_starter_template/screens/choose_language_screen.dart';
import 'package:flutter_starter_template/screens/games/number_detail_screen.dart';
import 'package:flutter_starter_template/screens/games/number_detail_screen2.dart';
import 'package:flutter_starter_template/screens/games/number_details_screen_with_puppy_background.dart';
import 'package:flutter_starter_template/screens/games/number_details_screen_with_puppy_background_2.dart';
import 'package:flutter_starter_template/screens/games/numbers_screen.dart';
import 'package:flutter_starter_template/screens/games/one_boy_playing_screen.dart';
import 'package:flutter_starter_template/screens/games/one_puppy_screen.dart';
import 'package:flutter_starter_template/screens/games/story.dart';
import 'package:flutter_starter_template/screens/games/two_boy_playing_screen.dart';
import 'package:flutter_starter_template/screens/games/two_puppies_scren.dart';
import 'package:flutter_starter_template/screens/home_page_view.dart';
import 'package:flutter_starter_template/screens/home_screen.dart';
import 'package:flutter_starter_template/theme/theme_constants.dart';
import 'package:flutter_starter_template/theme/theme_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:one_context/one_context.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  final List<NavigatorObserver> navigatorObservers;
  final String? entryPointRouteName;

  const MyApp({
    Key? key,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.entryPointRouteName,
  }) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter starter template',
      debugShowCheckedModeBanner: false,
      navigatorKey: OneContext().key,
      builder: OneContext().builder,
      theme: getAppTheme(context: context, isDarkTheme: themeMode),
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        MaterialLocalizationsRw.delegate,
        CupertinoLocalizationsRw.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        ChooseCharacterScreen.routeName: (context) =>
            const ChooseCharacterScreen(),
        ChooseLanguageScreen.routeName: (context) =>
            const ChooseLanguageScreen(),
        HomePageView.routeName: (context) => const HomePageView(),
        NumbersScreen.routeName: (context) => const NumbersScreen(),
        NumberDetailScreen.routeName: (context) => const NumberDetailScreen(),
        NumberDetailsScreenWithPuppyBackground.routeName: (context) =>
            const NumberDetailsScreenWithPuppyBackground(),
        OnePuppyScreen.routeName: (context) => const OnePuppyScreen(),
        OneBoyPlayingScreen.routeName: (context) => const OneBoyPlayingScreen(),
        NumberDetailScreen2.routeName: (context) => const NumberDetailScreen2(),
        TwoPuppiesScren.routeName: (context) => const TwoPuppiesScren(),
        NumberDetailsScreenWithPuppyBackground2.routeName: (context) =>
            const NumberDetailsScreenWithPuppyBackground2(),
        TwoBoyPlayingScreen.routeName: (context) => const TwoBoyPlayingScreen(),
        Story.routeName: (context) => const Story(),
      },
    );
  }
}
