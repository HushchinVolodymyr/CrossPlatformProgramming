import 'package:app/models/T4Models.dart';
import 'package:flutter/material.dart';
import 'package:app/services/Task4Calculator.dart';
import 'package:app/widgets/MyDrawer.dart';

class Task4Page extends StatefulWidget {
  @override
  _Task4PageState createState() => _Task4PageState();
}

class _Task4PageState extends State<Task4Page> {
  final List<TextEditingController> controllers =
      List.generate(11, (_) => TextEditingController());

  T4ResponseModel? result;

  void _calculateTask4() {
    double transformerPower = double.tryParse(controllers[0].text) ?? 0.0;
    double voltageCable = double.tryParse(controllers[1].text) ?? 0.0;
    double distanceCable = double.tryParse(controllers[2].text) ?? 0.0;
    double maxVoltDropCable = double.tryParse(controllers[3].text) ?? 0.0;
    double circuitVoltage = double.tryParse(controllers[4].text) ?? 0.0;
    double circuitImpedance = double.tryParse(controllers[5].text) ?? 0.0;
    double voltageSubstation = double.tryParse(controllers[6].text) ?? 0.0;
    double rNormal = double.tryParse(controllers[7].text) ?? 0.0;
    double xNormal = double.tryParse(controllers[8].text) ?? 0.0;
    double rMin = double.tryParse(controllers[9].text) ?? 0.0;
    double xMin = double.tryParse(controllers[10].text) ?? 0.0;

    List<CableOption> cables = selectCable(
        transformerPower, voltageCable, distanceCable, maxVoltDropCable);
    SubstationStates substation = calculateCurrents(
        voltageSubstation, rNormal, xNormal, rMin, xMin);
    double threePhase = threePhaseCurrent(
        circuitVoltage, circuitImpedance);
    double singlePhase = singlePhaseCurrent(
        circuitVoltage, circuitImpedance);

    setState(() {
      result = T4ResponseModel(
        cableOptions: cables,
        substationStates: substation,
        threePhaseCurrent: threePhase,
        singlePhaseCurrent: singlePhase,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 4")),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: List.generate(11, (index) {
                        List<String> hints = [
                          'Transformer Power',
                          'Voltage Cable',
                          'Distance Cable',
                          'Max Voltage Drop',
                          'Circuit Voltage',
                          'Circuit Impedance',
                          'Voltage Substation',
                          'R Normal',
                          'X Normal',
                          'R Min',
                          'X Min',
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
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _calculateTask4,
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                        ),
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
                        Text("Selected Cables:"),
                        ...result!.cableOptions.map((c) => Text(
                            "${c.crossSection} mm² ${c.material}, Max ${c.maxCurrent}A, Resistance ${c.resistance}Ω, Reactance ${c.reactance}Ω")),
                        Text("\nSubstation States:"),
                        Text("Normal: ${result!.substationStates.normalState}"),
                        Text("Minimal: ${result!.substationStates.minimalState}"),
                        Text("Fault: ${result!.substationStates.faultState}"),
                        Text("\nCurrents:"),
                        Text("Three-Phase: ${result!.threePhaseCurrent}"),
                        Text("Single-Phase: ${result!.singlePhaseCurrent}"),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}