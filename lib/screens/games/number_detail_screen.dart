import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/number_details_screen_with_puppy_background.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_starter_template/screens/games/number_details_template.dart';

class NumberDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = '/number-detail-screen';
  const NumberDetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NumberDetailScreen> createState() => _NumberDetailScreenState();
}

class _NumberDetailScreenState extends ConsumerState<NumberDetailScreen> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speakOne() async {
    await flutterTts.speak('one');
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
        onPlayNext: () => NavigatorHelper.pushNamed(
          NumberDetailsScreenWithPuppyBackground.routeName,
        ),
        onPlayPrevious: () => NavigatorHelper.pop(),
        context: context,
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
              'assets/images/number_details/number_one.png',
              fit: BoxFit.contain,
            ),
            Positioned(
              bottom: 10,
              child: Stack(
                children: [
                  Text(
                    'One',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      // Use stroke for the outline
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.black,
                    ),
                  ),
                  // FILL (Top Text)
                  const Text(
                    'One',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        onVolumeTap: _speakOne, // Pass your TTS function here.
      ),
    );
  }
}
