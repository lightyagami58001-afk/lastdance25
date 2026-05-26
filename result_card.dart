import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';

class ResultCard extends StatelessWidget {
  final String icon;
  final String name;
  final String scientificName;
  final String badge;
  final Color badgeColor;
  final String description;
  final double confidence;
  final bool isDangerous;

  const ResultCard({
    super.key,
    required this.icon,
    required this.name,
    required this.scientificName,
    required this.badge,
    required this.badgeColor,
    required this.description,
    required this.confidence,
    required this.isDangerous,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: (isDangerous ? AppTheme.danger : AppTheme.safe).withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: (isDangerous ? AppTheme.danger : AppTheme.safe).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: AppTheme.glow, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(scientificName, style: const TextStyle(color: AppTheme.glow, fontSize: 10, fontStyle: FontStyle.italic)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: badgeColor.withOpacity(0.3)),
                ),
                child: Text(badge, style: TextStyle(color: badgeColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: AppTheme.glow, fontSize: 12)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: confidence / 100,
              backgroundColor: Colors.white.withOpacity(0.1),
              color: isDangerous ? AppTheme.danger : AppTheme.safe,
              minHeight: 4,
            ),
          ),
          const SizedBox(height: 4),
          Text('Confidence: ${confidence.toStringAsFixed(1)}%', style: const TextStyle(color: AppTheme.glow, fontSize: 9)),
        ],
      ),
    );
  }
}
