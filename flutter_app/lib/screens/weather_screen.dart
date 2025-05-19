import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace the Container below with a StreamBuilder for live weather updates
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Weather Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
            width: 340,
            height: 180,
            child: Center(
              child: Text(
                'Weather details for the route will appear here.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}