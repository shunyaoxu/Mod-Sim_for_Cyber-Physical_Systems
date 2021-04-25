within CourseExamples.Lab2.DimmingLED;
model DimmingALED
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    amplitude=1,
    rising=2,
    width=2,
    falling=2,
    period=8,
    offset=0) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Arduino.Firmata.PWMOutput pWMOutput(digitalPin=9) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Arduino.Firmata.Port port(port="COM4") annotation (Placement(transformation(extent={{36,20},{56,40}})));
equation
  connect(trapezoid.y, pWMOutput.u) annotation (Line(points={{-19,30},{-2,30}}, color={0,0,127}));
  connect(pWMOutput.pinConnector, port.boardConnector) annotation (Line(points={{20,30},{36,30}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"));
end DimmingALED;
