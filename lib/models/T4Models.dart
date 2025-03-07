import 'package:app/services/Task4Calculator.dart';

class T4ResponseModel {
  final List<CableOption> cableOptions;
  final SubstationStates substationStates;
  final double threePhaseCurrent;
  final double singlePhaseCurrent;

  T4ResponseModel({
    required this.cableOptions,
    required this.substationStates,
    required this.threePhaseCurrent,
    required this.singlePhaseCurrent,
  });
}

class SubstationStates {
  final double normalState;
  final double minimalState;
  final String faultState;

  SubstationStates( {
    required this.normalState,
    required this.minimalState,
    required this.faultState,
  });
}
