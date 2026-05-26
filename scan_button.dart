import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';

class ScanButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ScanButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.lime,
        foregroundColor: AppTheme.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
