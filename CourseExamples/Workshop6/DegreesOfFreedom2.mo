within CourseExamples.Workshop6;
model DegreesOfFreedom2
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-46,30},{-26,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{26,30},{46,50}})));
equation
  connect(inertia.flange_b, idealGear.flange_a)
    annotation (Line(points={{-26,40},{-10,40}}, color={0,0,0}));
  connect(idealGear.flange_b, inertia1.flange_a)
    annotation (Line(points={{10,40},{26,40}}, color={0,0,0}));
  annotation (Icon(graphics, coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics, coordinateSystem(preserveAspectRatio=false)));
end DegreesOfFreedom2;
