import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';
import 'package:flutter_starter_template/screens/games/two_boy_playing_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_starter_template/screens/games/number_details_template.dart';

class TwoPuppiesScren extends ConsumerStatefulWidget {
  static const String routeName = '/two-puppies-screen';

  const TwoPuppiesScren({Key? key}) : super(key: key);

  @override
  ConsumerState<TwoPuppiesScren> createState() => _TwoPuppiesScrenScreenState();
}

class _TwoPuppiesScrenScreenState extends ConsumerState<TwoPuppiesScren> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speakOne() async {
    await flutterTts.speak('These are two puppies');
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  final GlobalKey<ShakeWidgetState> shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNumberDetailsTemplate(
        shakeKey: shakeKey,
        context: context,
        onPlayNext: () => NavigatorHelper.pushNamed(
          TwoBoyPlayingScreen.routeName,
        ),
        onPlayPrevious: () => NavigatorHelper.pop(),
        content: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1.2,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                'assets/images/backgrounds/lesson_number.png',
                fit: BoxFit.contain,
              ),
            ),
            Image.asset(
              'assets/images/number_details/puppy.png',
              fit: BoxFit.contain,
            ),
            const Positioned(
              bottom: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // "One" in red with black outline
                  Text(
                    'These are',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'two',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'puppies',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onVolumeTap: _speakOne, // Pass your TTS function here.
      ),
    );
  }
}
