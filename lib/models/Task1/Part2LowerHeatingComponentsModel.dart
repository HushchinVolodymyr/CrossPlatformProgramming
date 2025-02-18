class Task1Part2LowerHeatingComponents {
  final double carbon;
  final double hydrogen;
  final double oxygen;
  final double sulfur;
  final double ash;
  final double vanadium;
  final double lowerHeatingValue;
  final double moisture;

  Task1Part2LowerHeatingComponents({
    required this.carbon,
    required this.hydrogen,
    required this.oxygen,
    required this.sulfur,
    required this.ash,
    required this.vanadium,
    required this.lowerHeatingValue,
    required this.moisture,
  });
}

class Task1Part2ResponseModel {
  final double carbonWorkingMass;
  final double hydrogenWorkingMass;
  final double oxygenWorkingMass;
  final double sulfurWorkingMass;
  final double ashWorkingMass;
  final double vanadiumWorkingMass;
  final double lowerHeatingValueWorkingMass;

  Task1Part2ResponseModel({
    required this.carbonWorkingMass,
    required this.hydrogenWorkingMass,
    required this.oxygenWorkingMass,
    required this.sulfurWorkingMass,
    required this.ashWorkingMass,
    required this.vanadiumWorkingMass,
    required this.lowerHeatingValueWorkingMass,
  });

  @override
  String toString() {
    return 'Task1Part2ResponseModel{carbonWorkingMass: $carbonWorkingMass, hydrogenWorkingMass: $hydrogenWorkingMass, oxygenWorkingMass: $oxygenWorkingMass, sulfurWorkingMass: $sulfurWorkingMass, ashWorkingMass: $ashWorkingMass, vanadiumWorkingMass: $vanadiumWorkingMass, lowerHeatingValueWorkingMass: $lowerHeatingValueWorkingMass}';
  }
}
