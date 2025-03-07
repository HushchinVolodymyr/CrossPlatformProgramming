import 'package:app/models/T3Models.dart';
import 'package:app/services/Task3Calculator.dart';
import 'package:app/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class Task3page extends StatefulWidget {
  @override
  _Task3pageState createState() => _Task3pageState();
}

class _Task3pageState extends State<Task3page> {
  // Controllers for text fields
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  // Result of calculation
  T3ResultModel? result;

  void _calculateTask3() {
    // Get values from text fields
    double energyPower = double.tryParse(controllers[0].text) ?? 0.0;
    double oldErrorDeviation = double.tryParse(controllers[1].text) ?? 0.0;
    double newErrorDeviation = double.tryParse(controllers[2].text) ?? 0.0;
    double energyPrice = double.tryParse(controllers[3].text) ?? 0.0;

    // Calculate imbalance
    double probabilityImbalance = Task3calculator.calculate_probability(
        energyPower - oldErrorDeviation, energyPower + oldErrorDeviation, 0.01);
    double profitImbalance = Task3calculator.calculate_profit(
        energyPower, probabilityImbalance / 100, energyPrice);
    double peniyaImbalance = Task3calculator.calculate_profit(
        energyPower, (100 - probabilityImbalance) / 100, energyPrice);

    // Calculate balance
    double probabilityBalance = Task3calculator.calculate_probability(
        energyPower - newErrorDeviation, energyPower + newErrorDeviation, 0.01);
    double profitBalance = Task3calculator.calculate_profit(
        energyPower, probabilityBalance / 100, energyPrice);
    double peniyaBalance = Task3calculator.calculate_profit(
        energyPower, (100 - probabilityBalance) / 100, energyPrice);

    // Calculate total 
    double totalImbalance = profitImbalance - peniyaImbalance;
    double totalBalance = profitBalance - peniyaBalance;

    // Set the result
    setState(() {
      result = T3ResultModel(
        probabilityImbalance: probabilityImbalance,
        profitImbalance: profitImbalance,
        peniyaImbalance: peniyaImbalance,
        totalImbalance: totalImbalance,

        probabilityBalance: probabilityBalance,
        profitBalance: profitBalance,
        peniyaBalance: peniyaBalance,
        totalBalance: totalBalance,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 3")),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Fields
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<String> hints = [
                          'Energy Power',
                          'Old Error Deviation',
                          'New Error Deviation',
                          'Energy Price',
                        ];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TextField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                              hintText: hints[index],
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _calculateTask3,
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

            // Result Display
            Expanded(
              child: result == null
                  ? Center(
                      child: Text("Enter values to calculate",
                          style: TextStyle(fontSize: 18)))
                  : ListView(
                      children: [
                        Text("Imbalances:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Probability Imbalance: ${result!.probabilityImbalance.toStringAsFixed(2)}"),
                        Text("Profit Imbalance: ${result!.profitImbalance.toStringAsFixed(2)}"),
                        Text("Peniya Imbalance: ${result!.peniyaImbalance.toStringAsFixed(2)}"),
                        Text("Total Imbalance: ${result!.totalImbalance.toStringAsFixed(2)}"),
                        
                        SizedBox(height: 10),

                        Text("Balances:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Probability Balance: ${result!.probabilityBalance.toStringAsFixed(2)}"),
                        Text("Profit Balance: ${result!.profitBalance.toStringAsFixed(2)}"),
                        Text("Peniya Balance: ${result!.peniyaBalance.toStringAsFixed(2)}"),
                        Text("Total Balance: ${result!.totalBalance.toStringAsFixed(2)}"),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
