import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/config.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/signup_screen.dart';
import 'package:flutter_starter_template/screens/choose_character_screen.dart';
import 'package:flutter_starter_template/screens/choose_language_screen.dart';
import 'package:flutter_starter_template/screens/common/error_screen.dart';
import 'package:flutter_starter_template/screens/games/numbers_screen.dart';
import 'package:flutter_starter_template/screens/home_screen.dart';
import 'package:flutter_starter_template/widgets/auth_checker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

final _key = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(firebaseinitializerProvider);

    return GoRouter(
      navigatorKey: _key,
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: 'login',
          path: AppRoutes.initialRoute,
          builder: (context, state) => const AuthChecker(),
        ),
        GoRoute(
          name: 'home',
          path: AppRoutes.homeScreenRouteName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'signup',
          path: AppRoutes.signupScreenRouteName,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          name: 'authchecker',
          path: AppRoutes.authCheckerRouteName,
          builder: (context, state) => const AuthChecker(),
        ),
        GoRoute(
          name: 'loginScreen',
          path: AppRoutes.loginScreenRouteName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: 'chooseCharacterScreen',
          path: AppRoutes.chooseCharacterScreenRouteName,
          builder: (context, state) => const ChooseCharacterScreen(),
        ),
        GoRoute(
          name: 'chooseLanguageScreen',
          path: AppRoutes.chooseLanguageScreenRouteName,
          builder: (context, state) => const ChooseLanguageScreen(),
        ),
        GoRoute(
          name: 'numbersScreen',
          path: AppRoutes.numbersScreenRouteName,
          builder: (context, state) => const NumbersScreen(),
        ),
        // GoRoute(
        //   name: 'homePageScreen',
        //   path: AppRoutes.homePageScreenRouteName,
        //   builder: (context, state) => const HomePageView(),
        // ),
      ],
      errorBuilder: (context, state) => const ErrorScreen(),
      redirect: (context, state) {
        authState.when(
          data: (data) {
            return const AuthChecker();
          },
          error: (error, stackTrace) => const ErrorScreen(),
          loading: () => const CircularProgressIndicator(),
        );
        return null;
      },
    );
  },
);
