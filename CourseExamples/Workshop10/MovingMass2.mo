within CourseExamples.Workshop10;
model MovingMass2
  Modelica.Mechanics.Translational.Sources.Position position(exact=true)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Mechanics.Translational.Components.Mass mass annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Sources.Step step(startTime=0.1) annotation (Placement(transformation(extent={{-46,20},{-26,40}})));
equation
  connect(position.flange, mass.flange_a) annotation (Line(points={{20,30},{40,30}}, color={0,127,0}));
  connect(step.y, position.s_ref) annotation (Line(points={{-25,30},{-2,30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MovingMass2;
