import 'dart:async';
import '../models/location.dart';
import '../models/route.dart';
import '../models/weather.dart';
import 'weather_service.dart';

class NavigationService {
  final WeatherService _weatherService = WeatherService();

  // Simulate navigation updates as a stream of strings
  Stream<String> get navigationUpdates async* {
    final updates = [
      'Calculating route...',
      'Head north on Main St.',
      'Turn right onto 2nd Ave.',
      'Heavy rain ahead, rerouting...',
      'Arrived at your destination!',
    ];
    for (final update in updates) {
      await Future.delayed(const Duration(seconds: 2));
      yield update;
    }
  }

  Future<RouteModel> calculateRoute(Location source, Location destination) async {
    // In a real app, this would call a maps/navigation API
    final waypoints = _generateWaypoints(source, destination);
    final weatherConditions = await _getWeatherForWaypoints(waypoints);

    return RouteModel(
      source: source,
      destination: destination,
      waypoints: waypoints,
      weatherConditions: weatherConditions,
      distance: _calculateDistance(waypoints),
      estimatedTime: _estimateTime(waypoints, weatherConditions),
    );
  }

  List<Location> _generateWaypoints(Location source, Location destination) {
    // Simplified waypoint generation
    return [
      source,
      Location(
        name: 'Waypoint 1',
        latitude: (source.latitude + destination.latitude) / 2,
        longitude: (source.longitude + destination.longitude) / 2,
      ),
      destination,
    ];
  }

  Future<List<Weather>> _getWeatherForWaypoints(List<Location> waypoints) async {
    final weatherList = <Weather>[];
    for (final waypoint in waypoints) {
      final weather = await _weatherService.getWeather(waypoint);
      weatherList.add(weather);
    }
    return weatherList;
  }

  double _calculateDistance(List<Location> waypoints) {
    // Simplified distance calculation
    return waypoints.length * 10.0; // km
  }

  Duration _estimateTime(List<Location> waypoints, List<Weather> conditions) {
    // Basic time estimation considering weather
    double baseTime = waypoints.length * 15.0; // minutes

    // Add delay for bad weather
    for (final weather in conditions) {
      if (weather.condition == 'Rainy') baseTime *= 1.3;
      if (weather.condition == 'Stormy') baseTime *= 1.5;
    }

    return Duration(minutes: baseTime.round());
  }
}