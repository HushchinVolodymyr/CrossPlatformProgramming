// Fuel components
class FuelComponents {
  final double hydrogen;
  final double carbon;
  final double sulfur;
  final double nitrogen;
  final double oxygen;
  final double moister;
  final double ash;

  FuelComponents({
    required this.hydrogen,
    required this.carbon,
    required this.sulfur,
    required this.nitrogen,
    required this.oxygen,
    required this.moister,
    required this.ash,
  });
}

class FuelResponse {
  final double kRS;
  final double kRG;
  final String hydrogenDry;
  final String carbonDry;
  final String sulfurDry;
  final double nitrogenDry;
  final String oxygenDry;
  final String ashDry;
  final String hydrogenCombustible;
  final String carbonCombustible;
  final String sulfurCombustible;
  final double nitrogenCombustible;
  final String oxygenCombustible;
  final String lowerHeatingValueWorking;
  final String lowerHeatingValueDry;
  final String lowerHeatingValueCombustible;

  FuelResponse({
    required this.kRS,
    required this.kRG,
    required this.hydrogenDry,
    required this.carbonDry,
    required this.sulfurDry,
    required this.nitrogenDry,
    required this.oxygenDry,
    required this.ashDry,
    required this.hydrogenCombustible,
    required this.carbonCombustible,
    required this.sulfurCombustible,
    required this.nitrogenCombustible,
    required this.oxygenCombustible,
    required this.lowerHeatingValueWorking,
    required this.lowerHeatingValueDry,
    required this.lowerHeatingValueCombustible,
  });

  @override
  String toString() {
    return '''
Fuel Response:
  KRS: $kRS
  KRG: $kRG
  Hydrogen (Dry): $hydrogenDry
  Carbon (Dry): $carbonDry
  Sulfur (Dry): $sulfurDry
  Nitrogen (Dry): $nitrogenDry
  Oxygen (Dry): $oxygenDry
  Ash (Dry): $ashDry
  Hydrogen (Combustible): $hydrogenCombustible
  Carbon (Combustible): $carbonCombustible
  Sulfur (Combustible): $sulfurCombustible
  Nitrogen (Combustible): $nitrogenCombustible
  Oxygen (Combustible): $oxygenCombustible
  Lower Heating Value (Working): $lowerHeatingValueWorking
  Lower Heating Value (Dry): $lowerHeatingValueDry
  Lower Heating Value (Combustible): $lowerHeatingValueCombustible
''';
  }
}
