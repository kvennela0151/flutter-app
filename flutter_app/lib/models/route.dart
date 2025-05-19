import 'location.dart';
import 'weather.dart';

class RouteModel {
  final Location source;
  final Location destination;
  final List<Location> waypoints;
  final List<Weather> weatherConditions;
  final double distance; // in kilometers
  final Duration estimatedTime;

  RouteModel({
    required this.source,
    required this.destination,
    required this.waypoints,
    required this.weatherConditions,
    required this.distance,
    required this.estimatedTime,
  });
}