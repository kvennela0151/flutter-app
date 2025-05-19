import 'package:flutter/material.dart';
import '../utils/constants.dart';

class LocationInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const LocationInput({
    super.key,
    required this.label,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.screenPadding,
      child: TextField(
        controller: controller,
        readOnly: onTap != null,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.location_on, color: AppColors.primary),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}