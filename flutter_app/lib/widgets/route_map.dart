import 'package:flutter/material.dart';
import '../utils/constants.dart';

class RouteMap extends StatelessWidget {
  const RouteMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppStyles.screenPadding,
      height: 200,
      decoration: AppStyles.cardDecoration.copyWith(
        color: Colors.blue[100],
      ),
      child: const Center(
        child: Text(
          'Map will be displayed here',
          style: TextStyle(color: AppColors.textLight),
        ),
      ),
    );
  }
}