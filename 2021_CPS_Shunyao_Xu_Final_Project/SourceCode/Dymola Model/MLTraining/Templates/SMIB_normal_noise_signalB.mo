within OpenCPS_D53B.MLTraining.Templates;
partial model SMIB_normal_noise_signalB
  replaceable Interfaces.Power_System power_System annotation (Placement(transformation(extent={{42,2},{78,38}})));
  replaceable Interfaces.Signal signal annotation (Placement(transformation(extent={{-78,2},{-42,38}})));
equation
  connect(signal.signal_out, power_System.signal_in) annotation (Line(points={{-40.92,20},{40.92,20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SMIB_normal_noise_signalB;
