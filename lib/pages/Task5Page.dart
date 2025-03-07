import 'package:app/models/T5Models.dart';
import 'package:flutter/material.dart';
import 'package:app/services/Task5Calculator.dart'; // Adjust if needed
import 'package:app/widgets/MyDrawer.dart';

class Task5Page extends StatefulWidget {
  @override
  _Task5PageState createState() => _Task5PageState();
}

class _Task5PageState extends State<Task5Page> {
  // Create a list of controllers for the text fields
  final List<TextEditingController> controllers =
      List.generate(9, (_) => TextEditingController());

  // Create a variable to store the result
  T5ResponseModel? result;

  // Create a function to calculate the task
  void _calculateTask5() {
    double egActivity = double.tryParse(controllers[0].text) ?? 0.0;
    double pl = double.tryParse(controllers[1].text) ?? 0.0;
    double plLong = double.tryParse(controllers[2].text) ?? 0.0;
    double transmission = double.tryParse(controllers[3].text) ?? 0.0;
    double activ = double.tryParse(controllers[4].text) ?? 0.0;
    double connection = double.tryParse(controllers[5].text) ?? 0.0;
    double conTimes = double.tryParse(controllers[6].text) ?? 0.0;
    double costAvar = double.tryParse(controllers[7].text) ?? 0.0;
    double costPlan = double.tryParse(controllers[8].text) ?? 0.0;

    // Call the calculator functions
    String circuitReliability = calcReliable(
      egActivity, pl, plLong, transmission, activ, connection, conTimes
    );
    double losses = calcLosses(costAvar, costPlan);

    // Update the result variable
    setState(() {
      result = T5ResponseModel(
        circuitReliability: circuitReliability,
        losses: losses,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 5")),
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
                      children: List.generate(9, (index) {
                        List<String> hints = [
                          'EG Activity',
                          'PL',
                          'PL Long',
                          'Transmission',
                          'Activity',
                          'Connection',
                          'Connection Times',
                          'Cost Avar',
                          'Cost Plan',
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
                        onPressed: _calculateTask5,
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
                        Text("Circuit Reliability:"),
                        Text(result!.circuitReliability),
                        Text("\nLosses:"),
                        Text(result!.losses.toString()),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
