import 'package:flutter/material.dart';
import '../widgets/location_input.dart';
import '../models/location.dart';
import 'navigation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Location? source;
    Location? destination;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Weather Navigation'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          LocationInput(
            label: 'Starting Point',
            onLocationSelected: (location) => source = location,
          ),
          LocationInput(
            label: 'Destination',
            onLocationSelected: (location) => destination = location,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.navigation),
            label: const Text('Start Navigation'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (source != null && destination != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationScreen(
                      source: source!,
                      destination: destination!,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}