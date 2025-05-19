import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              weather.condition,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Temperature: ${weather.temperature}°C'),
            Text('Wind: ${weather.windSpeed} km/h'),
            Text('Precipitation: ${weather.precipitation} mm'),
            Text('Time: ${weather.time.hour}:${weather.time.minute.toString().padLeft(2, '0')}'),
          ],
        ),
      ),
    );
  }
}