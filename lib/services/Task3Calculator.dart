import 'dart:math';

class Task3calculator {

  static double calculate_profit(double average_power, double probability, double enregy_price) {
    return (average_power * 24 * probability) * enregy_price;
  }

  static double normal_distibution(double x, double mean, double stdDev) {
    return (1 / (stdDev * sqrt(2 * pi))) * exp(-pow(x-mean, 2) / (2 * pow(stdDev, 2)));
  }

  static double calculate_probability(double lower_bound, double upper_bound, double step) {
    double integral = 0.0;

    for (double x = lower_bound; x < upper_bound; x+=step) {
      double y1 = normal_distibution(x, 5.0, 1.0);
      double y2 = normal_distibution(x+step, 5.0, 1.0);
      integral += (y1 + y2) * step / 2;
    }

    return integral * 100;
  }
}