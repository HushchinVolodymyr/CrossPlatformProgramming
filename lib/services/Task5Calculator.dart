String calcReliable(double egActivity, double pl, double plLong, double transmission, double activ, double connection, double conTimes) {
  double omegaOS = egActivity + pl * plLong + transmission + activ + connection * conTimes;

  double tBsOs = (egActivity * 30 + (pl * plLong) * 10 + transmission * 100 + activ * 15 + (connection * conTimes) * 2) / omegaOS;

  double kaOs = (omegaOS * tBsOs) / 8760;

  double knOs = 1.2 * (43 / 8760);

  double omegaDk = 2 * (kaOs * 10e-4 + knOs);

  double omegaDs = omegaDk + 0.02;

  if (omegaDs < omegaOS) {
    return "Double circuit system is more reliable";
  } else if (omegaDs > omegaOS) {
    return "Single circuit system is more reliable";
  } else {
    return "Both systems are equally reliable";
  }
}

double calcLosses(double costAvar, double costPlan) {
  double mWnedl = (0.01 * (45 * 0.01) * (5.12 * 0.01) * 6451) * 10000;
  double mWnedp = ((4 * 0.01) * (5.12 * 0.01) * 6451) * 10000;

  double loss = costAvar * mWnedl + costPlan * mWnedp;

  return loss;
}
