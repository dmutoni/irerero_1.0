import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/one_puppy_screen.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_starter_template/screens/games/number_details_template.dart';

class NumberDetailsScreenWithPuppyBackground extends ConsumerStatefulWidget {
  static const String routeName =
      '/number-detail-with-puppy-backgground-screen';

  const NumberDetailsScreenWithPuppyBackground({Key? key}) : super(key: key);

  @override
  ConsumerState<NumberDetailsScreenWithPuppyBackground> createState() =>
      _NumberDetailsScreenWithPuppyBackgroundScreenState();
}

class _NumberDetailsScreenWithPuppyBackgroundScreenState
    extends ConsumerState<NumberDetailsScreenWithPuppyBackground> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speakOne() async {
    await flutterTts.speak('one banana');
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
          OnePuppyScreen.routeName,
        ),
        onPlayPrevious: () => NavigatorHelper.pop(),
        content: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1.2,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                'assets/images/number_details/puppy_background.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 50,
              child: Image.asset(
                'assets/images/fruits/banana.png',
                width: 130,
                height: 130,
                // fit: BoxFit.contain,
              ),
            ),
            const Positioned(
              bottom: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // "One" in red with black outline
                  Text(
                    'one',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'banana',
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
