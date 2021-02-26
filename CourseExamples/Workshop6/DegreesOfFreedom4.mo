within CourseExamples.Workshop6;
model DegreesOfFreedom4
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-46,22},{-26,42}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1
    annotation (Placement(transformation(extent={{30,22},{50,42}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper
    annotation (Placement(transformation(extent={{-10,22},{10,42}})));
equation
  connect(springDamper.flange_b, fixed1.flange)
    annotation (Line(points={{10,32},{40,32}}, color={0,0,0}));
  connect(springDamper.flange_a, fixed.flange)
    annotation (Line(points={{-10,32},{-36,32}}, color={0,0,0}));
  annotation (Icon(graphics, coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics, coordinateSystem(preserveAspectRatio=false)));
end DegreesOfFreedom4;
