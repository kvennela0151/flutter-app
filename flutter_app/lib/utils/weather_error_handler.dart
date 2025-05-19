import 'package:flutter/material.dart';

void handleWeatherError(BuildContext context, dynamic error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Weather Error: ${error.toString()}'),
      backgroundColor: Colors.red,
    ),
  );
}