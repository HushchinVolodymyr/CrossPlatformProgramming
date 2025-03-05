

class Task2calculator {
  // Emission factor for calculating the carbon footprint of electricity consumption
  static double _coal_emission_factor = 150.0;
  static double _oil_emission_factor = 0.57;
  static double _gas_emission_factor = 0.0;

  // Geters for the emission factors
  static double get_coal_emission_factor() {
    return _coal_emission_factor;
  }

  static double get_oil_emission_factor() {
    return _oil_emission_factor;
  }

  static double get_gas_emission_factor() {
    return _gas_emission_factor;
  }

  // Calculate emission of coal
  static double calculate_coal_emission(double kg, double heatValue) {
    return 1e-6 * _coal_emission_factor * heatValue * kg;
  }

  // Calculate emission of oil
  static double calculate_oil_emission(double kg, double heatValue) {
    return 1e-6 * _oil_emission_factor * heatValue * kg;
  }
  
  // Calculate emission of gas
  static double calculate_gas_emission(double kg, double heatValue) {
    return 1e-6 * _gas_emission_factor * heatValue * kg;
  }

  // Calculate the total emission
  static double calculate_total_emission(double coal, double oil, double gas) {
    return coal + oil + gas;
  }
}