import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;
  final String baseUrl = 'https://pokeapi.co/api/v2/';

  ApiClient({required this.client});

  Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await client.get(
      Uri.parse('$baseUrl$endPoint'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> getFullUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('API 요청 실패: ${response.statusCode}, ${response.body}');
    }
  }
}
