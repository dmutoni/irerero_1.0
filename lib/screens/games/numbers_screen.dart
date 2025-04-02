import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/navigator_helper.dart';
import 'package:flutter_starter_template/screens/games/number_detail_screen.dart';

class NumbersScreen extends StatefulWidget {
  final String? type;
  static const routeName = '/numbers-screen';

  const NumbersScreen({Key? key, this.type}) : super(key: key);

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  Future<List<String>> loadFruitImages(BuildContext context) async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Filter to only get images in the assets/fruits/ folder.
    final fruitImages = manifestMap.keys
        .where((String key) => key.startsWith('assets/images/fruits/'))
        .toList();

    return fruitImages;
  }

  String numberToWord(int number) {
    switch (number) {
      case 1:
        return 'one';
      case 2:
        return 'two';
      case 3:
        return 'three';
      case 4:
        return 'four';
      case 5:
        return 'five';
      case 6:
        return 'six';
      case 7:
        return 'seven';
      case 8:
        return 'eight';
      case 9:
        return 'nine';
      case 10:
        return 'ten';
      default:
        return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('numbers screen ${widget.type}');
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/screen_background.png',
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder<List<String>>(
            future: loadFruitImages(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No fruit images found.'));
              }

              // We have a list of all fruit image paths.
              final fruitImages = snapshot.data!;
              final randomGenerator = Random();

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 boxes per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    // If we only want to do this logic for "numbers" type:
                    // if (widget.type != 'numbers') {
                    //   // Otherwise, maybe display something else or an empty box
                    //   return const SizedBox.shrink();
                    // }

                    final randomFruit = fruitImages[
                        randomGenerator.nextInt(fruitImages.length)];

                    final count = index + 1;

                    final numberWord = numberToWord(count);
                    return GestureDetector(
                      onTap: () {
                        NavigatorHelper.pushNamed(
                          NumberDetailScreen.routeName,
                        );
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/backgrounds/lesson_number.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          // The fruit images inside the box
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Display the fruit images in a Wrap to fit multiple copies.
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 4,
                                  children: List.generate(count, (i) {
                                    return Image.asset(
                                      randomFruit,
                                      width: 30, // Adjust size as needed.
                                      height: 30,
                                    );
                                  }),
                                ),
                                const SizedBox(height: 8),
                                // Display the number word.
                                Text(
                                  numberWord,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
