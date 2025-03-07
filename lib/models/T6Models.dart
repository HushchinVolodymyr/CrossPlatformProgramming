class DeviceRespModel {
  final double? N;
  final double? Cos;
  final double? U;
  final double? Count;
  final double? Ph;
  final double? NP;
  final double? Kv;
  final double? Tg;
  final double? NPK;
  final double? NPKTg;
  final double? NP2;
  final double? EfficiencyQuantity;
  final double? ActivPowerCoefficient;
  final double? EstimatedActiveLoad;
  final double? EstimatedReactiveLoad;
  final double? FullPower;
  final double? I;

  DeviceRespModel({
    this.N,
    this.Cos,
    this.U,
    this.Count,
    this.Ph,
    this.NP,
    this.Kv,
    this.Tg,
    this.NPK,
    this.NPKTg,
    this.NP2,
    this.EfficiencyQuantity,
    this.ActivPowerCoefficient,
    this.EstimatedActiveLoad,
    this.EstimatedReactiveLoad,
    this.FullPower,
    this.I,
  });
}

class T6ResponseModel {
  DeviceRespModel grinding;
  DeviceRespModel drilled;
  DeviceRespModel jointing;
  DeviceRespModel circularSaw;
  DeviceRespModel press;
  DeviceRespModel polishing;
  DeviceRespModel shaper;
  DeviceRespModel fan;

  DeviceRespModel shr1;
  DeviceRespModel shr2;
  DeviceRespModel shr3;

  DeviceRespModel welding;
  DeviceRespModel dryer;

  DeviceRespModel fullLoad;

  T6ResponseModel({
    required this.grinding,
    required this.drilled,
    required this.jointing,
    required this.circularSaw,
    required this.press,
    required this.polishing,
    required this.shaper,
    required this.fan,
    required this.shr1,
    required this.shr2,
    required this.shr3,
    required this.welding,
    required this.dryer,
    required this.fullLoad,
  });
}