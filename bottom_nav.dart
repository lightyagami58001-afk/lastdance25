import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.dark,
        border: Border(top: BorderSide(color: AppTheme.lime.withOpacity(0.15))),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.lime,
        unselectedItemColor: AppTheme.glow.withOpacity(0.3),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'SCAN'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'GPS'),
          BottomNavigationBarItem(icon: Icon(Icons.camping), label: 'CAMPS'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'WATER'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'STORM'),
        ],
      ),
    );
  }
}
