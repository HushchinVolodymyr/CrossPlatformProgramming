import 'package:app/models/T6Models.dart';
import 'package:app/services/Task6Calculator.dart';
import 'package:app/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class Task6Page extends StatefulWidget {
  @override
  _Task6PageState createState() => _Task6PageState();
}


class _Task6PageState extends State<Task6Page> {
  // List of device names
  final List<String> deviceNames = [
    "Grinding",
    "Drilled",
    "Jointing",
    "CircularSaw",
    "Press",
    "Polishing",
    "Shaper",
    "Fan",
    "Welding",
    "Dryer"
  ];

  // List of lists of TextEditingControllers for each device's inputs
  final List<List<TextEditingController>> deviceControllers = List.generate(
    10, 
    (_) => List.generate(
      7,
      (_) => TextEditingController(),
    ),
  );

  // Result data
  T6ResponseModel? resultData;

  // Calculate the task
  void _calculate() {
    List<DeviceRespModel> deviceResponses = [];

    for (int i = 0; i < deviceNames.length; i++) {
      final controllers = deviceControllers[i];

      // Get input values from the text controllers
      double? n = double.tryParse(controllers[0].text);
      double? cos = double.tryParse(controllers[1].text);
      double? u = double.tryParse(controllers[2].text);
      double? count = double.tryParse(controllers[3].text);
      double? ph = double.tryParse(controllers[4].text);
      double? kv = double.tryParse(controllers[5].text);
      double? tg = double.tryParse(controllers[6].text);

      // Calculate device result
      DeviceRespModel device = calcDevice(
          n ?? 0, cos ?? 0, u ?? 0, count ?? 0, ph ?? 0, kv ?? 0, tg ?? 0);

      // Add the calculated device response to the list
      deviceResponses.add(device);
    }

    // Calculate SHR result
    DeviceRespModel shrResult = calcShr(
        deviceResponses[0],
        deviceResponses[1],
        deviceResponses[2],
        deviceResponses[3],
        deviceResponses[4],
        deviceResponses[5],
        deviceResponses[6],
        deviceResponses[7]);

    // Calculate full load result
    DeviceRespModel fullLoad = calcFullLoad();

    // Update the result data
    setState(() {
      resultData = T6ResponseModel(
          grinding: deviceResponses[0],
          drilled: deviceResponses[1],
          jointing: deviceResponses[2],
          circularSaw: deviceResponses[3],
          press: deviceResponses[4],
          polishing: deviceResponses[5],
          shaper: deviceResponses[6],
          fan: deviceResponses[7],
          shr1: shrResult,
          shr2: shrResult,
          shr3: shrResult,
          welding: deviceResponses[8],
          dryer: deviceResponses[9],
          fullLoad: fullLoad);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task 6")),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (int i = 0; i < deviceNames.length; i++)
              _buildDeviceInputRow(
                deviceNames[i],
                deviceControllers[i],
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: Text("Submit"),
            ),
            SizedBox(height: 16),
            Expanded(
                child: resultData == null
                    ? Center(
                        child: Text("Enter values to calculate",
                            style: TextStyle(fontSize: 18)))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Center(child: Text('Device'))),
                            DataColumn(label: Center(child: Text('N'))),
                            DataColumn(label: Center(child: Text('Cos'))),
                            DataColumn(label: Center(child: Text('U'))),
                            DataColumn(label: Center(child: Text('Count'))),
                            DataColumn(label: Center(child: Text('Ph'))),
                            DataColumn(label: Center(child: Text('NP'))),
                            DataColumn(label: Center(child: Text('Kv'))),
                            DataColumn(label: Center(child: Text('Tg'))),
                            DataColumn(label: Center(child: Text('NPK'))),
                            DataColumn(label: Center(child: Text('NPKTg'))),
                            DataColumn(label: Center(child: Text('NP2'))),
                            DataColumn(
                                label:
                                    Center(child: Text('Efficiency Quantity'))),
                            DataColumn(
                                label: Center(
                                    child: Text('Active Power Coefficient'))),
                            DataColumn(
                                label: Center(
                                    child: Text('Estimated Active Load'))),
                            DataColumn(
                                label: Center(
                                    child: Text('Estimated Reactive Load'))),
                            DataColumn(
                                label: Center(child: Text('Full Power'))),
                            DataColumn(label: Center(child: Text('I'))),
                          ],
                          rows: [
                            _buildRow('Grinding', resultData!.grinding),
                            _buildRow('Drilled', resultData!.drilled),
                            _buildRow('Jointing', resultData!.jointing),
                            _buildRow('Circular Saw', resultData!.circularSaw),
                            _buildRow('Press', resultData!.press),
                            _buildRow('Polishing', resultData!.polishing),
                            _buildRow('Shaper', resultData!.shaper),
                            _buildRow('Fan', resultData!.fan),
                            _buildRow('SHR1', resultData!.shr1),
                            _buildRow('SHR2', resultData!.shr2),
                            _buildRow('SHR3', resultData!.shr3),
                            _buildRow('Welding', resultData!.welding),
                            _buildRow('Dryer', resultData!.dryer),
                            _buildRow('Full Load', resultData!.fullLoad),
                          ],
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  DataRow _buildRow(String deviceName, DeviceRespModel model) {
    String format(double? value) =>
        value != null ? value.toStringAsFixed(2) : 'N/A';
    return DataRow(cells: [
      DataCell(Text(deviceName)),
      DataCell(Text(format(model.N))),
      DataCell(Text(format(model.Cos))),
      DataCell(Text(format(model.U))),
      DataCell(Text(format(model.Count))),
      DataCell(Text(format(model.Ph))),
      DataCell(Text(format(model.NP))),
      DataCell(Text(format(model.Kv))),
      DataCell(Text(format(model.Tg))),
      DataCell(Text(format(model.NPK))),
      DataCell(Text(format(model.NPKTg))),
      DataCell(Text(format(model.NP2))),
      DataCell(Text(format(model.EfficiencyQuantity))),
      DataCell(Text(format(model.ActivPowerCoefficient))),
      DataCell(Text(format(model.EstimatedActiveLoad))),
      DataCell(Text(format(model.EstimatedReactiveLoad))),
      DataCell(Text(format(model.FullPower))),
      DataCell(Text(format(model.I))),
    ]);
  }

  Widget _buildDeviceInputRow(
      String deviceName, List<TextEditingController> controllers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(deviceName, style: TextStyle(fontSize: 16)),
          ),
          for (int i = 0; i < controllers.length; i++)
            Expanded(
              child: _buildTextField(getLabelForField(i), controllers[i]),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  String getLabelForField(int index) {
    switch (index) {
      case 0:
        return 'N';
      case 1:
        return 'Cos';
      case 2:
        return 'U';
      case 3:
        return 'Count';
      case 4:
        return 'Ph';
      case 5:
        return 'Kv';
      case 6:
        return 'Tg';
      default:
        return '';
    }
  }
}
