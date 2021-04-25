within CourseExamples.Lab2.RobotArm;
model Subsystem
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Sources.Constant const(k=k) annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=threshold)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  parameter Real threshold=10 "Comparison with respect to threshold";
  parameter Real k=0 "Constant output value";
equation
  connect(continuousClock.y, greaterThreshold.u) annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(greaterThreshold.y, switch1.u2) annotation (Line(points={{-19,0},{-2,0}}, color={255,0,255}));
  connect(const.y, switch1.u3) annotation (Line(points={{-19,-40},{-8,-40},{-8,-8},{-2,-8}}, color={0,0,127}));
  connect(switch1.y, from_deg.u) annotation (Line(points={{21,0},{38,0}}, color={0,0,127}));
  connect(u, switch1.u1) annotation (Line(points={{-120,0},{-90,0},{-90,40},{-8,40},{-8,8},{-2,8}}, color={0,0,127}));
  connect(from_deg.y, y) annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Subsystem;
