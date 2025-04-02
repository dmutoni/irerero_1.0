import 'dart:math';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Custom ShakeWidget that shakes its child when triggered.
class ShakeWidget extends StatefulWidget {
  final Widget child;
  const ShakeWidget({Key? key, required this.child}) : super(key: key);

  @override
  ShakeWidgetState createState() => ShakeWidgetState();
}

class ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ValueNotifier to track if the widget is shaking.
  final ValueNotifier<bool> isShakingNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.addListener(() {
      isShakingNotifier.value = _controller.isAnimating;
    });
  }

  /// Starts the shake animation.
  void shake() {
    _controller.forward(from: 0);
  }

  /// Stops the shake animation.
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
        final double offsetX = sin(_controller.value * pi * 4) * 10;
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: widget.child,
        );
      },
    );
  }
}

/// Template that builds the details screen using a ShakeWidget.
/// A new unique GlobalKey is created internally for each instance.
Widget buildNumberDetailsTemplate({
  required BuildContext context,
  required Widget content,
  VoidCallback? onVolumeTap,
  VoidCallback? onPlayPrevious,
  VoidCallback? onPlayNext,
  VoidCallback? onPlay,
}) {
  // Create a new unique GlobalKey for this instance.
  final GlobalKey<ShakeWidgetState> shakeKey = GlobalKey<ShakeWidgetState>();

  return Stack(
    children: [
      // Background image.
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
            // Volume icon with tap callback.
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onVolumeTap,
                child: Image.asset('assets/images/number_details/volume.png'),
              ),
            ),
            const SizedBox(height: 100),
            // Content wrapped in ShakeWidget using the unique key.
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
                        'assets/images/number_details/play_previous.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      shakeKey.currentState?.shake();
                    },
                    child: Image.asset(
                        'assets/images/number_details/play_button.png'),
                  ),
                  GestureDetector(
                    onTap: onPlayNext,
                    child: Image.asset(
                        'assets/images/number_details/play_next.png'),
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

/// StoryDetailScreen displays a story page using the template and uses TTS to speak the content.
class StoryDetailScreen extends StatefulWidget {
  final String title;
  final String content;
  const StoryDetailScreen(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.5);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void _speakStory() {
    flutterTts.speak(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    // Create a widget to display the story's title and content.
    final contentWidget = Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text(widget.content,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );

    // Use our template, passing the TTS function to the volume icon.
    return buildNumberDetailsTemplate(
      context: context,
      content: contentWidget,
      onVolumeTap: _speakStory,
      onPlayPrevious: () {
        // Optional: add behavior for previous page.
      },
      onPlayNext: () {
        // Optional: add behavior for next page.
      },
    );
  }
}

/// Story screen uses the PageFlipWidget to flip through pages.
class Story extends StatefulWidget {
  static const String routeName = '/story';
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final GlobalKey<PageFlipWidgetState> _pageFlipKey =
      GlobalKey<PageFlipWidgetState>();

  // A list of story pages.
  final List<Map<String, String>> storyPages = [
    {
      'title': 'The Adventures of Little Learner\nPage 1',
      'content':
          'Once upon a time, in a land full of magic and wonder, Little Learner discovered a mysterious book. Every page sparkled with the promise of learning letters and numbers.'
    },
    {
      'title': 'The Adventures of Little Learner\nPage 2',
      'content':
          'As he turned the pages, he learned that A was for Apple, B was for Ball, and each letter opened a new door to adventure.'
    },
    {
      'title': 'The Adventures of Little Learner\nPage 3',
      'content':
          'Numbers began to dance as well: 1, 2, 3, and so on, each number a key to puzzles and mysteries waiting to be solved.'
    },
    {
      'title': 'The Adventures of Little Learner\nPage 4',
      'content':
          'With every page, Little Learner grew wiser and more curious, ready to explore the magic of learning.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: _pageFlipKey,
        backgroundColor: Colors.white,
        // Use a StoryDetailScreen as the last page to maintain type consistency.
        lastPage: StoryDetailScreen(
          key: UniqueKey(),
          title: 'The End!',
          content:
              'Thank you for joining Little Learner on this magical journey of discovery.',
        ),
        // Create one StoryDetailScreen for each story page.
        children: storyPages.asMap().entries.map((entry) {
          return StoryDetailScreen(
            key: UniqueKey(),
            title: entry.value['title']!,
            content: entry.value['content']!,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () {
          // Example: Jump to the second page (0-indexed: page 1).
          _pageFlipKey.currentState?.goToPage(1);
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Story(),
  ));
}
