import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';
import 'package:kanlungan_ph/shared/widgets/scan_button.dart';
import 'package:kanlungan_ph/shared/widgets/result_card.dart';
import 'package:kanlungan_ph/features/animal_scanner/data/animal_repository.dart';

class AnimalScannerScreen extends StatefulWidget {
  const AnimalScannerScreen({super.key});
  @override
  State<AnimalScannerScreen> createState() => _AnimalScannerScreenState();
}

class _AnimalScannerScreenState extends State<AnimalScannerScreen> {
  AnimalScanResult? _result;
  bool _scanning = false;

  void _performScan() async {
    setState(() {
      _scanning = true;
      _result = null;
    });
    final repo = AnimalRepository();
    final result = await repo.scanAnimal(); // uses TFLite on-device
    setState(() {
      _scanning = false;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 4/3,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.forest,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.lime.withOpacity(0.2)),
            ),
            child: Stack(
              children: [
                Center(child: Icon(Icons.camera_alt, size: 48, color: AppTheme.lime.withOpacity(0.3))),
                if (_scanning) const Center(child: CircularProgressIndicator(color: AppTheme.lime)),
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      _scanning ? 'SCANNING...' : 'Point camera at animal or pest',
                      style: TextStyle(color: AppTheme.glow.withOpacity(0.6), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ScanButton(onPressed: _performScan, label: 'Scan Animal / Pest'),
        const SizedBox(height: 16),
        if (_result != null)
          ResultCard(
            icon: _result!.isDangerous ? '🐍' : '🐝',
            name: _result!.name,
            scientificName: '${_result!.scientificName} · ${_result!.localName}',
            badge: _result!.isDangerous ? 'DANGEROUS' : 'SAFE',
            badgeColor: _result!.isDangerous ? AppTheme.danger : AppTheme.safe,
            description: _result!.description,
            confidence: _result!.confidence,
            isDangerous: _result!.isDangerous,
          ),
      ],
    );
  }
}
