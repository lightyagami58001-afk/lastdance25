class PlantScanResult {
  final String name;
  final String scientificName;
  final bool isToxic;
  final double confidence;
  final String description;
  final String localName;

  PlantScanResult({
    required this.name,
    required this.scientificName,
    required this.isToxic,
    required this.confidence,
    required this.description,
    required this.localName,
  });

  static PlantScanResult fromTFLite(Map<String, dynamic> output) {
    // Mapping from TFLite output
    return PlantScanResult(
      name: output['label'],
      scientificName: output['scientific'],
      isToxic: output['toxicity'] == 'toxic',
      confidence: output['confidence'],
      description: output['details'],
      localName: output['local_name'],
    );
  }
}
