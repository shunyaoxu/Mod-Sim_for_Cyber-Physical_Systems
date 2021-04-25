within CourseExamples.Lab2.TemperatureMonitor;
model TemperatureMonitor
  Arduino.Firmata.Port port(port="COM4")
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Arduino.Firmata.AnalogInput A0(analogInputPin=0) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Arduino.Firmata.DigitalOutput D8(digitalPin=8) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Sources.Constant const(k=1.375) annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.Constant const1(k=0.0225) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Sources.Constant const2(k=67.85) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-40,-4},{-20,16}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(port.boardConnector, A0.pinConnector) annotation (Line(points={{-100,0},{-80,0}}, color={0,0,0}));
  connect(A0.y, add.u2) annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{-59,50},{-48,50},{-48,12},{-42,12}}, color={0,0,127}));
  connect(add.y, division.u1) annotation (Line(points={{-19,6},{-2,6}}, color={0,0,127}));
  connect(const1.y, division.u2) annotation (Line(points={{-19,-30},{-8,-30},{-8,-6},{-2,-6}}, color={0,0,127}));
  connect(division.y, greater.u1) annotation (Line(points={{21,0},{38,0}}, color={0,0,127}));
  connect(const2.y, greater.u2) annotation (Line(points={{21,-30},{32,-30},{32,-8},{38,-8}}, color={0,0,127}));
  connect(greater.y, D8.value) annotation (Line(points={{61,0},{78,0}}, color={255,0,255}));
  connect(port.boardConnector, D8.pinConnector)
    annotation (Line(points={{-100,0},{-100,-60},{100,-60},{100,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-140,-100},{120,100}})),
    experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"));
end TemperatureMonitor;
