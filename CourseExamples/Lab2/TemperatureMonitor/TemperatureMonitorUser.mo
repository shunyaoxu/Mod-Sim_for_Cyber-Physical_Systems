within CourseExamples.Lab2.TemperatureMonitor;
model TemperatureMonitorUser
  Arduino.Firmata.Port port(port="COM4")
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Arduino.Firmata.AnalogInput A0(analogInputPin=0) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Arduino.Firmata.DigitalOutput D8(digitalPin=8) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Sources.Constant const(k=1.375) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant const1(k=0.0225) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-40,-4},{-20,16}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  UserInteraction.Inputs.Slider threshold_slider(min=65, max=70)
    annotation (Placement(transformation(extent={{-18,50},{20,90}})));
  UserInteraction.Outputs.Bar temperature_display(min=65, max=70)
    annotation (Placement(transformation(extent={{-80,50},{-40,90}})));
  Modelica.Blocks.Sources.RealExpression threshold(y=threshold_slider.Value)
    annotation (Placement(transformation(extent={{2,-42},{22,-22}})));
  Modelica.Blocks.Sources.RealExpression temperature(y=division.u1)
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  UserInteraction.Outputs.IndicatorLamp indicatorLamp annotation (Placement(transformation(extent={{80,60},{100,80}})));
equation
  connect(port.boardConnector, A0.pinConnector) annotation (Line(points={{-100,0},{-80,0}}, color={0,0,0}));
  connect(A0.y, add.u2) annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{-59,30},{-48,30},{-48,12},{-42,12}}, color={0,0,127}));
  connect(add.y, division.u1) annotation (Line(points={{-19,6},{-2,6}}, color={0,0,127}));
  connect(const1.y, division.u2) annotation (Line(points={{-19,-30},{-8,-30},{-8,-6},{-2,-6}}, color={0,0,127}));
  connect(division.y, greater.u1) annotation (Line(points={{21,0},{38,0}}, color={0,0,127}));
  connect(greater.y, D8.value) annotation (Line(points={{61,0},{78,0}}, color={255,0,255}));
  connect(port.boardConnector, D8.pinConnector)
    annotation (Line(points={{-100,0},{-100,-60},{100,-60},{100,0}}, color={0,0,0}));
  connect(threshold.y, greater.u2) annotation (Line(points={{23,-32},{32,-32},{32,-8},{38,-8}}, color={0,0,127}));
  connect(temperature.y, temperature_display.Value) annotation (Line(points={{-99,70},{-82,70}}, color={0,0,127}));
  connect(greater.y, indicatorLamp.status) annotation (Line(points={{61,0},{72,0},{72,70},{80,70}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-140,-100},{120,100}})),
    experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"));
end TemperatureMonitorUser;
