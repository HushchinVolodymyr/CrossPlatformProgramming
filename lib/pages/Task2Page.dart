import 'package:app/models/Task2/T2Models.dart';
import 'package:app/services/Task2Calculator.dart';
import 'package:app/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class Task2page extends StatefulWidget {
  @override
  _Task2pageState createState() => _Task2pageState();
}

class _Task2pageState extends State<Task2page> {
  // Controllers for text fields
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  // Result of calculation
  T2resultmodel? result;

  void _calculateTask2() {
    double coalWeight = double.tryParse(controllers[0].text) ?? 0.0;
    double coalHeatValue = double.tryParse(controllers[1].text) ?? 0.0;
    double oilWeight = double.tryParse(controllers[2].text) ?? 0.0;
    double oilHeatValue = double.tryParse(controllers[3].text) ?? 0.0;
    double gasWeight = double.tryParse(controllers[4].text) ?? 0.0;
    double gasHeatValue = double.tryParse(controllers[5].text) ?? 0.0;

    setState(() {
      result = T2resultmodel(
        coalEmissionFactor: Task2calculator.get_coal_emission_factor(),
        coalEmission:
            Task2calculator.calculate_coal_emission(coalWeight, coalHeatValue),
        oilEmissionFactor: Task2calculator.get_oil_emission_factor(),
        oilEmission:
            Task2calculator.calculate_oil_emission(oilWeight, oilHeatValue),
        gasEmissionFactor: Task2calculator.get_gas_emission_factor(),
        gasEmission:
            Task2calculator.calculate_gas_emission(gasWeight, gasHeatValue),
        totalEmission: Task2calculator.calculate_total_emission(
          Task2calculator.calculate_coal_emission(coalWeight, coalHeatValue),
          Task2calculator.calculate_oil_emission(oilWeight, oilHeatValue),
          Task2calculator.calculate_gas_emission(gasWeight, gasHeatValue),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 2")),
      drawer: MyDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(6, (index) {
                          List<String> hints = [
                            'Coal Weight',
                            'Coal Heat Value',
                            'Oil Weight',
                            'Oil Heat Value',
                            'Gas Weight',
                            'Gas Heat Value'
                          ];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TextField(
                              controller: controllers[index],
                              decoration: InputDecoration(
                                hintText: hints[index],
                                border: OutlineInputBorder(),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _calculateTask2,
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18)),
                        child: Text("Calculate"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: result == null
                  ? Center(
                      child: Text("Enter values to calculate",
                          style: TextStyle(fontSize: 18)))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Coal Emission Factor: ${result!.coalEmissionFactor}"),
                        Text("Coal Emission: ${result!.coalEmission}"),
                        Text(
                            "Oil Emission Factor: ${result!.oilEmissionFactor}"),
                        Text("Oil Emission: ${result!.oilEmission}"),
                        Text(
                            "Gas Emission Factor: ${result!.gasEmissionFactor}"),
                        Text("Gas Emission: ${result!.gasEmission}"),
                        Text("Total Emission: ${result!.totalEmission}"),
                      ],
                    ),
            ),
          ])),
    );
  }
}
