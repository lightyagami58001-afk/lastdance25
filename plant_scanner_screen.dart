import 'package:flutter/material.dart';
import 'package:kanlungan_ph/core/theme/app_theme.dart';
import 'package:kanlungan_ph/shared/widgets/scan_button.dart';
import 'package:kanlungan_ph/shared/widgets/result_card.dart';
import 'package:kanlungan_ph/features/plant_scanner/data/tflite_repository.dart';
import 'package:kanlungan_ph/features/animal_scanner/presentation/animal_scanner_screen.dart';

class PlantScannerScreen extends StatefulWidget {
  const PlantScannerScreen({super.key});
  @override
  State<PlantScannerScreen> createState() => _PlantScannerScreenState();
}

class _PlantScannerScreenState extends State<PlantScannerScreen> {
  PlantScanResult? _result;
  bool _scanning = false;
  bool _animalMode = false;

  void _performScan() async {
    setState(() {
      _scanning = true;
      _result = null;
    });
    final repo = TFLiteRepository();
    final result = await repo.scanPlant();
    setState(() {
      _scanning = false;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => _animalMode = false),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: _animalMode ? Colors.transparent : AppTheme.lime.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _animalMode ? Colors.grey : AppTheme.lime),
                ),
                child: Text('🌿 Plant', style: TextStyle(color: _animalMode ? Colors.grey : AppTheme.glow)),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => setState(() => _animalMode = true),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: _animalMode ? AppTheme.lime.withOpacity(0.15) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _animalMode ? AppTheme.lime : Colors.grey),
                ),
                child: Text('🐾 Animal/Pest', style: TextStyle(color: _animalMode ? AppTheme.glow : Colors.grey)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (_animalMode)
          const Expanded(child: AnimalScannerScreen())
        else
          Expanded(
            child: Column(
              children: [
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
                              _scanning ? 'SCANNING...' : 'Point camera at plant, berry, or mushroom',
                              style: TextStyle(color: AppTheme.glow.withOpacity(0.6), fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ScanButton(onPressed: _performScan, label: 'Scan Plant'),
                const SizedBox(height: 16),
                if (_result != null)
                  ResultCard(
                    icon: _result!.isToxic ? '☠️' : '🌿',
                    name: _result!.name,
                    scientificName: '${_result!.scientificName} · ${_result!.localName}',
                    badge: _result!.isToxic ? 'TOXIC' : 'SAFE',
                    badgeColor: _result!.isToxic ? AppTheme.danger : AppTheme.safe,
                    description: _result!.description,
                    confidence: _result!.confidence,
                    isDangerous: _result!.isToxic,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
