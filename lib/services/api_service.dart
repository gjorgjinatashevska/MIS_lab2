import 'dart:convert';
import 'dart:io';

class ApiService {
  final String baseUrl = 'https://official-joke-api.appspot.com';
  Future<Map<String, dynamic>> getRandomJoke() async {
    final uri = Uri.parse('$baseUrl/random_joke');

    try {
      final response = await _makeRequest(uri);
      if (response != null) {
        return json.decode(response);
      } else {
        throw Exception('Failed to load joke');
      }
    } catch (e) {
      rethrow;
    }
  }Future<List<dynamic>> getJokesByType(String type) async {
    final uri = Uri.parse('$baseUrl/jokes/$type/ten');

    try {
      final response = await _makeRequest(uri);
      if (response != null) {
        return json.decode(response);
      } else {
        throw Exception('Failed to load jokes by type');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> fetchJokeTypes() async {
    final uri = Uri.parse('$baseUrl/types');

    try {
      final response = await _makeRequest(uri);
      if (response != null) {
        return List<String>.from(json.decode(response));
      } else {
        throw Exception('Failed to load joke types');
      }
    } catch (e) {
      rethrow;
    }
  }Future<Map<String, dynamic>> fetchRandomJoke() async {
    final uri = Uri.parse('$baseUrl/random_joke');

    try {
      final response = await _makeRequest(uri);
      if (response != null) {
        return json.decode(response);
      } else {
        throw Exception('Failed to load random joke');
      }
    } catch (e) {
      rethrow;
    }
  }Future<String?> _makeRequest(Uri uri) async {
    try {
      final request = await HttpClient().getUrl(uri);
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        return responseBody;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred while making the request: $e');
      return null;
    }
  }

  static fetchJokesByType(String type) {}
}
