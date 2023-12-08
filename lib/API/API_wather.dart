import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    const apiKey = 'bc90108b80204fb5906170504230409';
    final response = await http.get(
      Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
