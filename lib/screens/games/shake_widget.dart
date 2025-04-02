import 'dart:math';
import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  final Widget child;
  const ShakeWidget({Key? key, required this.child}) : super(key: key);

  @override
  ShakeWidgetState createState() => ShakeWidgetState();
}

class ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // A ValueNotifier to track whether the widget is shaking.
  final ValueNotifier<bool> isShakingNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Update our notifier when the animation state changes.
    _controller.addListener(() {
      isShakingNotifier.value = _controller.isAnimating;
    });
  }

  // Call this to start the shake animation.
  void shake() {
    _controller.forward(from: 0);
  }

  // Optionally, you can stop the shake.
  void stopShake() {
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    isShakingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Use a sine wave to create a left/right shake.
        final double offsetX = sin(_controller.value * pi * 4) * 10;
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: widget.child,
        );
      },
    );
  }
}
