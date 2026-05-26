class AnimalScanResult {
  final String name;
  final String scientificName;
  final bool isDangerous;  // venomous, aggressive, disease vector
  final double confidence;
  final String dangerType; // "venomous", "aggressive", "disease", "none"
  final String description;
  final String localName;

  AnimalScanResult({
    required this.name,
    required this.scientificName,
    required this.isDangerous,
    required this.confidence,
    required this.dangerType,
    required this.description,
    required this.localName,
  });

  static AnimalScanResult fromTFLite(Map<String, dynamic> output) {
    return AnimalScanResult(
      name: output['label'],
      scientificName: output['scientific'],
      isDangerous: output['danger'] != 'safe',
      confidence: output['confidence'],
      dangerType: output['danger_type'],
      description: output['details'],
      localName: output['local_name'],
    );
  }
}
