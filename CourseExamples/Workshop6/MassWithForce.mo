within CourseExamples.Workshop6;
model MassWithForce
  extends MassInGravityField;
  Modelica.Mechanics.MultiBody.Forces.WorldForce force
    annotation (Placement(transformation(extent={{-22,62},{-2,82}})));
  Modelica.Blocks.Sources.RealExpression realExpression[3](y=f)
    annotation (Placement(transformation(extent={{-66,62},{-46,82}})));
  Modelica.Units.SI.Force[3] f;
equation
  mass.frame_a.r_0 = {sin(time),0.1*time,cos(time)};
  connect(force.frame_b, mass.frame_a) annotation (Line(
      points={{-2,72},{0,72},{0,28},{2,28}},
      color={95,95,95},
      thickness=0.5));
  connect(realExpression.y, force.force)
    annotation (Line(points={{-45,72},{-24,72}}, color={0,0,127}));
end MassWithForce;
