class Weather {
  final String condition; // e.g., 'Sunny', 'Rainy', 'Cloudy'
  final double temperature; // in Celsius
  final double windSpeed; // in km/h
  final double precipitation; // in mm
  final DateTime time; // time of the weather data

  Weather({
    required this.condition,
    required this.temperature,
    required this.windSpeed,
    required this.precipitation,
    required this.time,
  });

  @override
  String toString() =>
      '$condition, ${temperature.toStringAsFixed(1)}°C, Wind: ${windSpeed.toStringAsFixed(1)} km/h, Precipitation: ${precipitation.toStringAsFixed(1)} mm';
}