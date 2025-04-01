import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/generate_images.dart';
import 'package:flutter_starter_template/values/assets/background_assets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NumbersScreen extends ConsumerStatefulWidget {
  const NumbersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends ConsumerState<NumbersScreen> {
  String generatePrompt(int number) {
    List<String> fruits = [
      'one bright red apple',
      'two shiny yellow lemons',
      'three fresh strawberries',
      'four juicy orange slices',
      'five dark purple plums',
      'six green watermelons',
      'seven fresh green pears',
      'eight red watermelon slices',
      'nine round coconuts',
      'ten small limes'
    ];

    return 'A high-resolution photo of a bunch of fresh strawberries on a transparent background, studio lighting, hyper-realistic details.';
  }

  String? imageUrl;
  final ImageGenerationService imageService = ImageGenerationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            BackgroundAssets.lessonsBackground,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for proper spacing
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0, // Adjust spacing if needed
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75, // Adjust based on your design
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle tap if necessary
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            12), // Optional rounded corners
                        child: Image.asset(
                          BackgroundAssets.numbersBackground,
                          fit: BoxFit.contain, // Prevents distortion
                        ),
                      ),
                    ),
                    FutureBuilder<String>(
                      future:
                          imageService.generateImage(generatePrompt(index + 1)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print(
                              'Error: ${snapshot.error}'); // 🔍 Debugging line
                          return const Center(
                              child: Text('Error loading image'));
                        } else if (snapshot.hasData) {
                          return Image.network(snapshot.data!);
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
