import '../models/location.dart';
import '../models/route.dart';

class RouteService {
  // Simulate route calculation between two locations
  Future<RouteModel> calculateRoute(Location start, Location end) async {
    // TODO: Replace with real routing logic or API call
    await Future.delayed(const Duration(seconds: 2));
    final segment = RouteSegment(
      start: start,
      end: end,
      distance: 12.5,
      duration: const Duration(minutes: 20),
    );
    return RouteModel(
      segments: [segment],
      totalDistance: 12.5,
      totalDuration: const Duration(minutes: 20),
    );
  }
}