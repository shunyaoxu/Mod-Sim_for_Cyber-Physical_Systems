within CourseExamples.Workshop10;
model SingleInertia
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    J=1,
    w(fixed=true, start=1),
    a(fixed=true, start=1)) annotation (Placement(transformation(extent={{-38,38},{-18,58}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SingleInertia;
