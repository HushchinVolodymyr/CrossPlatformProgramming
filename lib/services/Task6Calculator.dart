import 'dart:math';

import 'package:app/models/T6Models.dart';

// Calculate the device response
DeviceRespModel calcDevice(double n, double cos, double u, double count, double ph, double kv, double tg) {
  double np = count * ph;
  double npk = count * ph * kv;
  double npktg = count * ph * kv * tg;
  double np2 = count * pow(ph, 2);
  double i = (count * ph) / (sqrt(3) * u * cos * n);

  return DeviceRespModel(
    N: n,
    Cos: cos,
    U: u,
    Count: count,
    Ph: ph,
    Kv: kv,
    NP: np,
    Tg: tg,
    NPK: npk,
    NPKTg: npktg,
    NP2: np2,
    I: i,
    EfficiencyQuantity: null,
    ActivPowerCoefficient: null,
    EstimatedActiveLoad: null,
    EstimatedReactiveLoad: null,
    FullPower: null,
  );
}

DeviceRespModel calcShr(DeviceRespModel grinding, DeviceRespModel drilled, DeviceRespModel jointing,
    DeviceRespModel circularSaw, DeviceRespModel press, DeviceRespModel polishing,
    DeviceRespModel shaper, DeviceRespModel fan) {

  List<DeviceRespModel> devices = [
    grinding, drilled, jointing, circularSaw, press, polishing, shaper, fan
  ];

  double devicesCount = 0;
  double npCount = 0;
  double npkCount = 0;
  double npktgCount = 0;
  double np2Count = 0;

  for (var device in devices) {
    devicesCount += device.Count ?? 0;
    npCount += device.NP ?? 0;
    npkCount += device.NPK ?? 0;
    npktgCount += device.NPKTg ?? 0;
    np2Count += device.NP2 ?? 0;
  }

  double kvCount = npkCount / npCount;
  double efficiencyQuantityCount = pow(npCount, 2) / np2Count;
  double activPowerCoefficient = 1.25;
  double estimatedActiveLoadCount = activPowerCoefficient * npkCount;
  double estimatedReactiveLoad = 1.0 * npktgCount;
  double fullPowerCount = sqrt(pow(estimatedActiveLoadCount, 2) + pow(estimatedReactiveLoad, 2));
  double iCount = estimatedActiveLoadCount / 0.38;

  return DeviceRespModel(
    N: null,
    Cos: null,
    U: null,
    Count: devicesCount,
    Ph: null,
    NP: npCount,
    Kv: kvCount,
    Tg: null,
    NPK: npkCount,
    NPKTg: npktgCount,
    NP2: np2Count,
    EfficiencyQuantity: efficiencyQuantityCount,
    ActivPowerCoefficient: activPowerCoefficient,
    EstimatedActiveLoad: estimatedActiveLoadCount,
    EstimatedReactiveLoad: estimatedReactiveLoad,
    FullPower: fullPowerCount,
    I: iCount,
  );
}


DeviceRespModel calcFullLoad() {
  double deviceCount = 81;
  double npCount = 2330;
  double npkCount = 752;
  double npktgCount = 657;
  double np2Count = 96388;

  double kvCount = npkCount / npCount;
  double efficiencyQuantityCount = pow(npCount, 2) / np2Count;
  double activPowerCoefficient = 0.7;
  double estimatedActiveLoadCount = activPowerCoefficient * npkCount;
  double estimatedReactiveLoad = activPowerCoefficient * npktgCount;
  double fullPower = sqrt(pow(estimatedActiveLoadCount, 2) + pow(estimatedReactiveLoad, 2));
  double i = estimatedActiveLoadCount / 0.38;

  return DeviceRespModel(
    N: null,
    Cos: null,
    U: null,
    Count: deviceCount,
    Ph: null,
    NP: npCount,
    Kv: kvCount,
    Tg: null,
    NPK: npkCount,
    NPKTg: npktgCount,
    NP2: np2Count,
    EfficiencyQuantity: efficiencyQuantityCount,
    ActivPowerCoefficient: activPowerCoefficient,
    EstimatedActiveLoad: estimatedActiveLoadCount,
    EstimatedReactiveLoad: estimatedReactiveLoad,
    FullPower: fullPower,
    I: i,
  );
}
