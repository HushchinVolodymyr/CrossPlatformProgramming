import 'dart:math';

import 'package:app/models/T4Models.dart';

class CableOption {
  final double crossSection;
  final String material;
  final double maxCurrent;
  final double resistance;
  final double reactance;

  CableOption(this.crossSection, this.material, this.maxCurrent, this.resistance, this.reactance);
}

final List<CableOption> cableOptions = [
  CableOption(50.0, "Copper", 150.0, 0.386, 0.08),
  CableOption(70.0, "Copper", 190.0, 0.272, 0.075),
  CableOption(95.0, "Copper", 230.0, 0.206, 0.07),
  CableOption(120.0, "Copper", 260.0, 0.161, 0.065),
  CableOption(150.0, "Copper", 300.0, 0.129, 0.06),
  CableOption(185.0, "Copper", 340.0, 0.104, 0.055),
  CableOption(240.0, "Copper", 400.0, 0.078, 0.05),
  CableOption(300.0, "Copper", 450.0, 0.062, 0.045),
];

List<CableOption> selectCable(double transformerPower, double voltage, double distance, double maxVoltageDropPercent) {
  double nominalCurrent = transformerPower * 1000 / (sqrt(3) * voltage * 1000);
  List<CableOption> suitableCables = [];

  for (var cable in cableOptions) {
    double voltageDrop = nominalCurrent * (cable.resistance + cable.reactance) * distance;
    bool isCurrentOk = cable.maxCurrent >= nominalCurrent;
    bool isVoltageDropOk = (voltageDrop / (voltage * 1000)) * 100 <= maxVoltageDropPercent;
    if (isCurrentOk && isVoltageDropOk) {
      suitableCables.add(cable);
    }
  }
  return suitableCables;
}

double calculateShortCircuitCurrent(double U, double R, double X) {
  double Z = sqrt(R * R + X * X);
  return U / Z;
}

class Substation {
  final double normalState;
  final double minimalState;
  final String faultState;

  Substation(this.normalState, this.minimalState, this.faultState);
}

SubstationStates calculateCurrents(double voltage, double rNormal, double xNormal, double rMin, double xMin) {
  double normalState = calculateShortCircuitCurrent(voltage, rNormal, xNormal);
  double minimalState = calculateShortCircuitCurrent(voltage, rMin, xMin);

  return SubstationStates(
    normalState: normalState,
    minimalState: minimalState,
    faultState: "Fault state is not implemented",
  );
}

double threePhaseCurrent(double voltage, double impedance) {
  return (voltage * 1000) / (sqrt(3) * impedance);
}

double singlePhaseCurrent(double voltage, double impedance) {
  return (voltage * 1000) / impedance;
}
