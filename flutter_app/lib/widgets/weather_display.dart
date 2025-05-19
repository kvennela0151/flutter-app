import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/weather.dart';
import '../utils/constants.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  IconData _getWeatherIcon() {
    switch (weather.condition.toLowerCase()) {
      case 'clear':
        return WeatherIcons.day_sunny;
      case 'clouds':
        return WeatherIcons.cloud;
      case 'rain':
        return WeatherIcons.rain;
      case 'snow':
        return WeatherIcons.snow;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'drizzle':
        return WeatherIcons.sprinkle;
      case 'mist':
      case 'fog':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.day_sunny_overcast;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.cardDecoration,
      padding: AppStyles.cardPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BoxedIcon(
            _getWeatherIcon(),
            size: 48,
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
          Text(
            weather.condition,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _WeatherDetail(
            icon: WeatherIcons.thermometer,
            label: '${weather.temperature.toStringAsFixed(1)}°C',
          ),
          _WeatherDetail(
            icon: WeatherIcons.strong_wind,
            label: '${weather.windSpeed.toStringAsFixed(1)} km/h',
          ),
          _WeatherDetail(
            icon: WeatherIcons.raindrops,
            label: '${weather.precipitation.toStringAsFixed(1)} mm',
          ),
        ],
      ),
    );
  }
}

class _WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;

  const _WeatherDetail({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BoxedIcon(icon, size: 20, color: AppColors.textLight),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}