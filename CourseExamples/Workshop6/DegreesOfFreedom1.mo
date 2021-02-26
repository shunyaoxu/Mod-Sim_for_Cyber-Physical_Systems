within CourseExamples.Workshop6;
model DegreesOfFreedom1
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{-72,26},{-52,46}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2
    annotation (Placement(transformation(extent={{16,26},{36,46}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper
    annotation (Placement(transformation(extent={{-30,26},{-10,46}})));
equation
  connect(inertia1.flange_b, springDamper.flange_a)
    annotation (Line(points={{-52,36},{-30,36}}, color={0,0,0}));
  connect(springDamper.flange_b, inertia2.flange_a)
    annotation (Line(points={{-10,36},{16,36}}, color={0,0,0}));
  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
        coordinateSystem(preserveAspectRatio=false)));
end DegreesOfFreedom1;
