import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/games/stone_shape_view.dart';

class HomePageView extends StatefulWidget {
  static const routeName = '/home-page-view';
  const HomePageView({super.key});

  @override
  _HomePageViewPageState createState() => _HomePageViewPageState();
}

class _HomePageViewPageState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // You can adjust the speeds by changing these multipliers.
  // The background moves slower than the foreground.
  final double backgroundSpeedMultiplier =
      0.1; // One full screen scroll per cycle
  final double foregroundSpeedMultiplier =
      0.2; // Two full screen scrolls per cycle

  @override
  void initState() {
    super.initState();
    // The duration here sets the time for one complete cycle.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to obtain the screen height for seamless looping.
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calculate vertical offsets for background and foreground layers.
          // Multiplying by screenHeight makes a full cycle (from 0 to screenHeight).
          final double backgroundOffset =
              (_controller.value * screenHeight * backgroundSpeedMultiplier) %
                  screenHeight;
          final double foregroundOffset =
              (_controller.value * screenHeight * foregroundSpeedMultiplier) %
                  screenHeight;

          return Stack(
            children: [
              // Background Layer: two copies of the water image for endless scrolling.
              Positioned.fill(
                child: Stack(
                  children: [
                    // First copy
                    Positioned(
                      top: backgroundOffset,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/backgrounds/water.png',
                        height: screenHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Second copy placed above the first.
                    Positioned(
                      top: backgroundOffset - screenHeight,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/backgrounds/water.png',
                        height: screenHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: [
                    // First copy.
                    Positioned(
                      top: foregroundOffset,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: screenHeight,
                        child: const StoneShapesView(
                          scrollController: null,
                          texts: [
                            Text('Numbers'),
                            Text('Stories'),
                            Text('Shapes'),
                            Text('Animals'),
                            Text('Colors'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
