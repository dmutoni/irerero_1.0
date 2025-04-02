import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_starter_template/screens/games/number_details_template.dart';

class OneBoyPlayingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/one_boy_playing_screen';

  const OneBoyPlayingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OneBoyPlayingScreen> createState() =>
      _OneBoyPlayingScreenState();
}

class _OneBoyPlayingScreenState extends ConsumerState<OneBoyPlayingScreen> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speakOne() async {
    await flutterTts.speak('A boy has one ball');
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
              'assets/images/number_details/boy_with_ball.png',
              fit: BoxFit.contain,
            ),
            const Positioned(
              bottom: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'A boy has',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'one',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'ball',
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
        onVolumeTap: _speakOne,
      ),
    );
  }
}
