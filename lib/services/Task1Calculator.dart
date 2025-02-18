import 'package:app/models/Task1/Part1FuelComponentsModel.dart';
import 'package:app/models/Task1/Part2LowerHeatingComponentsModel.dart';

class FuelService {
  static FuelResponse calculateFuel(FuelComponents data) {
    // Calculate the coefficients
    double kRS = 100 / (100 - data.moister);
    double kRG = 100 / (100 - data.moister - data.ash);

    // Calculate the fuel components
    double hydrogenDry = data.hydrogen * kRS;
    double carbonDry = data.carbon * kRS;
    double sulfurDry = data.sulfur * kRS;
    double nitrogenDry = data.nitrogen * kRS;
    double oxygenDry = data.oxygen * kRS;
    double ashDry = data.ash * kRS;

    // Calculate the combustible components
    double hydrogenCombustible = data.hydrogen * kRG;
    double carbonCombustible = data.carbon * kRG;
    double sulfurCombustible = data.sulfur * kRG;
    double nitrogenCombustible = data.nitrogen * kRG;
    double oxygenCombustible = data.oxygen * kRG;

    // Calculate the lower heating value
    double lowerHeatingValueWorking = (339 * data.carbon + 1030 * data.hydrogen - 108.8 * (data.oxygen - data.sulfur) - 25 * data.moister) / 1000;
    double lowerHeatingValueDry = (lowerHeatingValueWorking + 0.025 * data.moister) * kRS;
    double lowerHeatingValueCombustible = (lowerHeatingValueWorking + 0.025 * data.moister) * kRG;

    // Return the response
    return FuelResponse(
      kRS: kRS,
      kRG: kRG,
      hydrogenDry: _formatPercentage(hydrogenDry),
      carbonDry: _formatPercentage(carbonDry),
      sulfurDry: _formatPercentage(sulfurDry),
      nitrogenDry: nitrogenDry,
      oxygenDry: _formatPercentage(oxygenDry),
      ashDry: _formatPercentage(ashDry),
      hydrogenCombustible: _formatPercentage(hydrogenCombustible),
      carbonCombustible: _formatPercentage(carbonCombustible),
      sulfurCombustible: _formatPercentage(sulfurCombustible),
      nitrogenCombustible: nitrogenCombustible,
      oxygenCombustible: _formatPercentage(oxygenCombustible),
      lowerHeatingValueWorking: _formatMJ(lowerHeatingValueWorking),
      lowerHeatingValueDry: _formatMJ(lowerHeatingValueDry),
      lowerHeatingValueCombustible: _formatMJ(lowerHeatingValueCombustible),
    );
  }

  static String _formatPercentage(double value) {
    return '${value.toStringAsFixed(2)}%';
  }

  static String _formatMJ(double value) {
    return '${value.toStringAsFixed(2)} МДж/кг';
  }

  static double _workingCalc(double element, Task1Part2LowerHeatingComponents components) {
    return element * (100 - components.moisture - components.ash) / 100;
  }

  static Task1Part2ResponseModel calculate(Task1Part2LowerHeatingComponents data) {
    double moistureFraction = data.moisture / 100;
    double ashFraction = data.ash / 100;

    double carbonWorking = _workingCalc(data.carbon, data);
    double hydrogenWorking = _workingCalc(data.hydrogen, data);
    double oxygenWorking = _workingCalc(data.oxygen, data);
    double sulfurWorking = _workingCalc(data.sulfur, data);
    double ashWorking = _workingCalc(data.ash, data);
    double vanadiumWorking = _workingCalc(data.vanadium, data);

    double heatingValueWorkingMass = data.lowerHeatingValue * (1 - moistureFraction) * (1 - ashFraction);

    return Task1Part2ResponseModel(
      carbonWorkingMass: carbonWorking,
      hydrogenWorkingMass: hydrogenWorking,
      oxygenWorkingMass: oxygenWorking,
      sulfurWorkingMass: sulfurWorking,
      ashWorkingMass: ashWorking,
      vanadiumWorkingMass: vanadiumWorking,
      lowerHeatingValueWorkingMass: heatingValueWorkingMass,
    );
  }
}
