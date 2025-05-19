import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../models/location.dart';

class WeatherService {
  static const String _apiKey = '7cb3faafa7195a32c933f91a539af52e'; // Replace with your API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> getWeather(Location location) async {
    final response = await http.get(Uri.parse(
      '$_baseUrl/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$_apiKey&units=metric'
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather(
        condition: data['weather'][0]['main'],
        temperature: data['main']['temp'].toDouble(),
        windSpeed: data['wind']['speed'].toDouble(),
        precipitation: data['rain']?['1h'] ?? 0.0,
        time: DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000),
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Weather>> getForecast(Location location) async {
    final response = await http.get(Uri.parse(
      '$_baseUrl/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$_apiKey&units=metric'
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Weather> forecast = [];
      
      for (var item in data['list']) {
        forecast.add(Weather(
          condition: item['weather'][0]['main'],
          temperature: item['main']['temp'].toDouble(),
          windSpeed: item['wind']['speed'].toDouble(),
          precipitation: item['rain']?['3h'] ?? 0.0,
          time: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
        ));
      }
      
      return forecast;
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}