import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';
import 'package:kanlungan_ph/features/plant_scanner/presentation/plant_scanner_screen.dart';
import 'package:kanlungan_ph/features/animal_scanner/presentation/animal_scanner_screen.dart';
import 'package:kanlungan_ph/features/gps_tracker/presentation/tracker_screen.dart';
import 'package:kanlungan_ph/features/camp_connector/presentation/camp_map_screen.dart';
import 'package:kanlungan_ph/features/water_finder/presentation/water_screen.dart';
import 'package:kanlungan_ph/features/typhoon_router/presentation/typhoon_screen.dart';
import 'package:kanlungan_ph/shared/widgets/bottom_nav.dart';

void main() {
  runApp(const KanlunganApp());
}

class KanlunganApp extends StatelessWidget {
  const KanlunganApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KANLUNGAN PH',
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const PlantScannerScreen(),
    const TrackerScreen(),
    const CampMapScreen(),
    const WaterScreen(),
    const TyphoonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
