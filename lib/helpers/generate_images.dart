import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageGenerationService {
  static const String apiKey =
      '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'; // Replace with your API key
  static const String baseUrl = 'https://api.openai.com/v1/images/generations';

  Future<String> generateImage(String prompt) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'dall-e-3',
        'prompt': prompt,
        'n': 1, // Number of images to generate
        'size': '1024x1024', // Adjust size as needed
        'transparent_background': true,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'][0]['url'];
    } else {
      throw Exception('Failed to generate image: ${response.body}');
    }
  }
}
