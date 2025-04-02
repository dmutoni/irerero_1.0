import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/one_boy_playing_screen.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_starter_template/screens/games/number_details_template.dart';

class TwoBoyPlayingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/two-puppies-screen-2';

  const TwoBoyPlayingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TwoBoyPlayingScreen> createState() =>
      _TwoBoyPlayingScreenState();
}

class _TwoBoyPlayingScreenState extends ConsumerState<TwoBoyPlayingScreen> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speakOne() async {
    await flutterTts.speak('Two kids with two balls');
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
          OneBoyPlayingScreen.routeName,
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
                    'Two',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'kids',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'with',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'two',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'balls',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
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
