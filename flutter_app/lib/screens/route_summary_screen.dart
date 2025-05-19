import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_service.dart';
import '../widgets/weather_display.dart';
import '../models/location.dart';

class RouteSummaryScreen extends StatelessWidget {
  const RouteSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Route Summary'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: context.read<WeatherService>().getForecast(
          Location(
            name: 'Current Location',
            latitude: 0,
            longitude: 0,
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final weather = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: WeatherDisplay(weather: weather),
                );
              },
            );
          }

          return const Center(child: Text('No forecast data available'));
        },
      ),
    );
  }
}