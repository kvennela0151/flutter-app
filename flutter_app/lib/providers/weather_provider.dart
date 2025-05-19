import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _currentWeather;
  bool _isLoading = false;
  String? _error;

  Weather? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Simulate fetching weather data for a location
  Future<void> fetchWeather(Location location) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Replace this with a real API call
      await Future.delayed(const Duration(seconds: 2));
      _currentWeather = Weather(
        condition: 'Sunny',
        temperature: 27.5,
        windSpeed: 12.0,
        precipitation: 0.0,
        time: DateTime.now(),
      );
    } catch (e) {
      _error = 'Failed to fetch weather data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _currentWeather = null;
    _error = null;
    notifyListeners();
  }
}