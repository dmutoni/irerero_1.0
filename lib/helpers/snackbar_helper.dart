import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:flutter_starter_template/values/durations.dart';
import 'package:flutter_starter_template/widgets/common/visual/app_top_snackbar.dart';

OverlayEntry? _currentEntry;
List<OverlayEntry> _queue = [];

abstract class SnackbarHelper {
  static clearQueue() {
    _queue = [];
  }

  static showSnackbar({
    required String message,
    required AppTopSnackbarLevel level,
    AppTopSnackbarVariant variant = AppTopSnackbarVariant.message,
    VoidCallback? onTap,
    Duration closeInterval = AppDurations.topSnackbarDuration,
    required BuildContext context,
  }) async {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return AppTopSnackbar(
          closeInterval: closeInterval,
          message: message,
          variant: variant,
          onDismissed: () {
            overlayEntry.remove();
            if (_queue.isNotEmpty) {
              _currentEntry = _queue.removeAt(0);
              overlayState.insert(_currentEntry!);
            } else {
              _currentEntry = null;
            }
          },
        );
      },
    );

    if (_currentEntry != null) {
      _queue.add(overlayEntry);
    } else {
      overlayState.insert(overlayEntry);
      _currentEntry = overlayEntry;
    }
  }
}
