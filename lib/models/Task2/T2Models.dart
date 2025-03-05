class T2resultmodel {
  final double coalEmissionFactor;
  final double coalEmission;
  final double oilEmissionFactor;
  final double oilEmission;
  final double gasEmissionFactor;
  final double gasEmission;
  final double totalEmission;

  T2resultmodel({
    required this.coalEmissionFactor,
    required this.coalEmission,
    required this.oilEmissionFactor,
    required this.oilEmission,
    required this.gasEmissionFactor,
    required this.gasEmission,
    required this.totalEmission,
  });

  @override
  String toString() {
    return 'T2resultmodel{coalEmissionFactor: $coalEmissionFactor, coalEmission: $coalEmission, oilEmissionFactor: $oilEmissionFactor, oilEmission: $oilEmission, gasEmissionFactor: $gasEmissionFactor, gasEmission: $gasEmission, totalEmission: $totalEmission}';
  }
}