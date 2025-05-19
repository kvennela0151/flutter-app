import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/route.dart';

class NavigationProvider extends ChangeNotifier {
  Location? _source;
  Location? _destination;
  RouteModel? _currentRoute;

  Location? get source => _source;
  Location? get destination => _destination;
  RouteModel? get currentRoute => _currentRoute;

  void setSource(Location location) {
    _source = location;
    notifyListeners();
  }

  void setDestination(Location location) {
    _destination = location;
    notifyListeners();
  }

  void setRoute(RouteModel route) {
    _currentRoute = route;
    notifyListeners();
  }

  void clear() {
    _source = null;
    _destination = null;
    _currentRoute = null;
    notifyListeners();
  }
}