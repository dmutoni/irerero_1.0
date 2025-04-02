import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/numbers_screen.dart';
// import 'package:flutter_starter_template/screens/games/numbers_screen.dart';
import 'package:flutter_starter_template/screens/games/story.dart';

class StoneShapesView extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Text>? texts;

  const StoneShapesView({super.key, this.scrollController, this.texts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: texts?.length ?? 0,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // NavigatorHelper.pushNamed(
            //   NumbersScreen.routeName,
            // );
            NavigatorHelper.pushNamed(
              Story.routeName,
              // arguments: 'numbers',
            );
          },
          child: Align(
            alignment:
                index.isEven ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/backgrounds/stone_shape.png',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      texts?[index].data ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
