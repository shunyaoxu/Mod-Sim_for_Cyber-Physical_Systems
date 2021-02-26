within CourseExamples.Workshop6;
model DegreesOfFreedom3
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-44,62},{-24,82}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2
    annotation (Placement(transformation(extent={{26,44},{46,64}})));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary idealPlanetary
    annotation (Placement(transformation(extent={{-10,44},{10,64}})));
equation
  connect(inertia.flange_b, idealPlanetary.carrier) annotation (Line(points={{
          -24,72},{-16,72},{-16,58},{-10,58}}, color={0,0,0}));
  connect(inertia1.flange_b, idealPlanetary.sun) annotation (Line(points={{-24,
          46},{-16,46},{-16,54},{-10,54}}, color={0,0,0}));
  connect(idealPlanetary.ring, inertia2.flange_a)
    annotation (Line(points={{10,54},{26,54}}, color={0,0,0}));
  annotation (Icon(graphics, coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics, coordinateSystem(preserveAspectRatio=false)));
end DegreesOfFreedom3;
