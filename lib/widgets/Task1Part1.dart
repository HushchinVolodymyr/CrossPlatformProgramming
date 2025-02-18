import 'package:app/models/Task1/Part1FuelComponentsModel.dart';
import 'package:app/services/Task1Calculator.dart';
import 'package:flutter/material.dart';

class Task1Part1 extends StatefulWidget {
  @override
  _Task1Part1State createState() => _Task1Part1State();
}

class _Task1Part1State extends State<Task1Part1> {
  // Controllers for text fields
  final List<TextEditingController> controllers =
      List.generate(7, (_) => TextEditingController());

  // Result of calculation
  FuelResponse? result;

  // Calculate the result
  void _calculateTask1Part1() {
    setState(() {
      result = FuelService.calculateFuel(FuelComponents(
        hydrogen: double.tryParse(controllers[0].text) ?? 0.0,
        carbon: double.tryParse(controllers[1].text) ?? 0.0,
        sulfur: double.tryParse(controllers[2].text) ?? 0.0,
        nitrogen: double.tryParse(controllers[3].text) ?? 0.0,
        oxygen: double.tryParse(controllers[4].text) ?? 0.0,
        moister: double.tryParse(controllers[5].text) ?? 0.0,
        ash: double.tryParse(controllers[6].text) ?? 0.0,
      ));
    });
  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(7, (index) {
                  List<String> hints = [
                    'Hydrogen',
                    'Carbon',
                    'Sulfur',
                    'Nitrogen',
                    'Oxygen',
                    'Moister',
                    'Ash'
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: hints[index],
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _calculateTask1Part1,
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text('Calculate'),
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
                      Text("Results:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("KRS: ${result!.kRS.toStringAsFixed(2)}"),
                      Text("KRG: ${result!.kRG.toStringAsFixed(2)}"),
                      Text("Hydrogen (Dry): ${result!.hydrogenDry}"),
                      Text("Carbon (Dry): ${result!.carbonDry}"),
                      Text("Sulfur (Dry): ${result!.sulfurDry}"),
                      Text("Nitrogen (Dry): ${result!.nitrogenDry}"),
                      Text("Oxygen (Dry): ${result!.oxygenDry}"),
                      Text("Ash (Dry): ${result!.ashDry}"),
                      Text(
                          "Hydrogen (Combustible): ${result!.hydrogenCombustible}"),
                      Text(
                          "Carbon (Combustible): ${result!.carbonCombustible}"),
                      Text(
                          "Sulfur (Combustible): ${result!.sulfurCombustible}"),
                      Text(
                          "Nitrogen (Combustible): ${result!.nitrogenCombustible}"),
                      Text(
                          "Oxygen (Combustible): ${result!.oxygenCombustible}"),
                      Text(
                          "Lower Heating Value (Working): ${result!.lowerHeatingValueWorking}"),
                      Text(
                          "Lower Heating Value (Dry): ${result!.lowerHeatingValueDry}"),
                      Text(
                          "Lower Heating Value (Combustible): ${result!.lowerHeatingValueCombustible}"),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
