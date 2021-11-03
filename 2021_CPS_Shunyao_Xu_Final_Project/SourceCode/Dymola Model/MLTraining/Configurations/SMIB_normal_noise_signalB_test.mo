within OpenCPS_D53B.MLTraining.Configurations;
model SMIB_normal_noise_signalB_test
  extends Templates.SMIB_normal_noise_signalB(redeclare Signal.SignalB signal, redeclare System.SMIB_normal_noise
      power_System);
  annotation (experiment(
      StopTime=300,
      Interval=0.001,
      __Dymola_Algorithm="Radau"));
end SMIB_normal_noise_signalB_test;
