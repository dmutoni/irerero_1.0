import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/assets/splash_screen_assets.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  final bool isLoading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ThemeColors.greenBackground,
            ),
          ),
          Image.asset(
            SplashScreenAssets
                .splashScreenLogo, // Replace 'background.svg' with your SVG file path
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

          Column(
            children: [
              const SizedBox(height: 700),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: AppButton(
                  title: 'Get started',
                  onTap: () {},
                ),
              ),
            ],
          ),

          // Center(
          //   child: GestureDetector(
          //     child: !isLoading
          //         ? const Text('Logout')
          //         : const CircularProgressIndicator(),
          //     onTap: () => {
          //       ref.read(authenticationProvider.notifier).signOut(),
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
