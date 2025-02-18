import 'package:app/models/Task1/Part2LowerHeatingComponentsModel.dart';
import 'package:app/services/Task1Calculator.dart';
import 'package:flutter/material.dart';

class Task1Part2 extends StatefulWidget {
  @override
  _Task1Part2State createState() => _Task1Part2State();
}

class _Task1Part2State extends State<Task1Part2> {
  // Controllers for the text fields
  final List<TextEditingController> controllersPart2 =
      List.generate(8, (_) => TextEditingController());

  // Result model
  Task1Part2ResponseModel? result;

  // Calculate the result
  void _calculateTask1Part2() {
    setState(() {
      result = FuelService.calculate(Task1Part2LowerHeatingComponents(
        carbon: double.tryParse(controllersPart2[0].text) ?? 0.0,
        hydrogen: double.tryParse(controllersPart2[1].text) ?? 0.0,
        oxygen: double.tryParse(controllersPart2[2].text) ?? 0.0,
        sulfur: double.tryParse(controllersPart2[3].text) ?? 0.0,
        lowerHeatingValue: double.tryParse(controllersPart2[4].text) ?? 0.0,
        moisture: double.tryParse(controllersPart2[5].text) ?? 0.0,
        ash: double.tryParse(controllersPart2[6].text) ?? 0.0,
        vanadium: double.tryParse(controllersPart2[7].text) ?? 0.0,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(8, (index) {
                        List<String> hints = [
                          'Carbon',
                          'Hydrogen',
                          'Oxygen',
                          'Sulfur',
                          'Lower Heating Value',
                          'Moisture',
                          'Ash',
                          'Vanadium'
                        ];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TextField(
                            controller: controllersPart2[index],
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: hints[index],
                              border: OutlineInputBorder(),
                            ),
                          ),
                        );
                      }),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: _calculateTask1Part2,
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
                            Text(
                                "Carbon Working Mass: ${result!.carbonWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Hydrogen Working Mass: ${result!.hydrogenWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Oxygen Working Mass: ${result!.oxygenWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Sulfur Working Mass: ${result!.sulfurWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Ash Working Mass: ${result!.ashWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Vanadium Working Mass: ${result!.vanadiumWorkingMass.toStringAsFixed(2)}"),
                            Text(
                                "Lower Heating Value Working Mass: ${result!.lowerHeatingValueWorkingMass.toStringAsFixed(2)}"),
                          ],
                        ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllersPart2) {
      controller.dispose();
    }
    super.dispose();
  }
}