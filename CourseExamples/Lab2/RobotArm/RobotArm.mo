within CourseExamples.Lab2.RobotArm;
model RobotArm
  Modelica.Blocks.Sources.ContinuousClock continuousClock annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=10)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  UserInteraction.Outputs.Bar bar(min=0, max=65) annotation (Placement(transformation(extent={{40,-80},{80,-40}})));
  Arduino.Firmata.DigitalOutput digitalOutput(digitalPin=12)
    annotation (Placement(transformation(extent={{62,-30},{82,-10}})));
  Arduino.Firmata.Port port annotation (Placement(transformation(extent={{100,0},{120,20}})));
  Arduino.Firmata.Servo servo(digitalPin=6) annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  UserInteraction.Inputs.Slider slider(min=0, max=65) annotation (Placement(transformation(extent={{-76,40},{-40,80}})));
equation
  connect(booleanConstant.y, digitalOutput.value) annotation (Line(points={{41,-20},{60,-20}}, color={255,0,255}));
  connect(digitalOutput.pinConnector, port.boardConnector)
    annotation (Line(points={{82,-20},{94,-20},{94,10},{100,10}}, color={0,0,0}));
  connect(from_deg.y, servo.u) annotation (Line(points={{41,10},{58,10}}, color={0,0,127}));
  connect(servo.pinConnector, port.boardConnector) annotation (Line(points={{80,10},{100,10}}, color={0,0,0}));
  connect(from_deg.u, bar.Value) annotation (Line(points={{18,10},{12,10},{12,-60},{38,-60}}, color={0,0,127}));
  connect(continuousClock.y, greaterThreshold.u) annotation (Line(points={{-79,10},{-62,10}}, color={0,0,127}));
  connect(greaterThreshold.y, switch1.u2) annotation (Line(points={{-39,10},{-22,10}}, color={255,0,255}));
  connect(switch1.y, bar.Value) annotation (Line(points={{1,10},{12,10},{12,-60},{38,-60}}, color={0,0,127}));
  connect(const.y, switch1.u3) annotation (Line(points={{-39,-30},{-28,-30},{-28,2},{-22,2}}, color={0,0,127}));
  connect(slider.Value, switch1.u1) annotation (Line(points={{-40,60},{-28,60},{-28,18},{-22,18}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{140,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{140,100}})),
    experiment(
      StopTime=60,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"));
end RobotArm;
