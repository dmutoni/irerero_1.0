import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/games/shake_widget.dart';

Widget buildNumberDetailsTemplate({
  required BuildContext context,
  required GlobalKey<ShakeWidgetState> shakeKey,
  required Widget content,
  VoidCallback? onVolumeTap,
  VoidCallback? onPlayPrevious,
  VoidCallback? onPlayNext,
  VoidCallback? onPlay,
}) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/backgrounds/screen_background.png',
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Wrap the volume icon in a GestureDetector and call onVolumeTap when pressed.
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onVolumeTap,
                child: Image.asset(
                  'assets/images/number_details/volume.png',
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ShakeWidget(
              key: shakeKey,
              child: content,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onPlayPrevious,
                    child: Image.asset(
                      'assets/images/number_details/play_previous.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      shakeKey.currentState?.shake();
                    },
                    child: Image.asset(
                      'assets/images/number_details/play_button.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: onPlayNext,
                    child: Image.asset(
                      'assets/images/number_details/play_next.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
