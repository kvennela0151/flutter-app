class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() => '$name (${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)})';
}