import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/durations.dart';

class AppAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const AppAnimatedSwitcher({
    Key? key,
    required this.child,
    this.alignment = Alignment.topCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedSizeAndFade(
        fadeDuration: Durations.normal,
        sizeDuration: Durations.normal,
        sizeCurve: Curves.easeInOut,
        alignment: alignment,
        child: child,
      );
}
