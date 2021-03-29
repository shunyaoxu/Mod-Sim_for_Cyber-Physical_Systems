within CourseExamples.Workshop10;
model MovingMass
  Modelica.Mechanics.Translational.Sources.Position position(exact=true)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Sine source(startTime=0.1) annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
  Modelica.Mechanics.Translational.Components.Mass mass annotation (Placement(transformation(extent={{40,20},{60,40}})));
equation
  connect(source.y, position.s_ref) annotation (Line(points={{-23,30},{-2,30}}, color={0,0,127}));
  connect(position.flange, mass.flange_a) annotation (Line(points={{20,30},{40,30}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MovingMass;
