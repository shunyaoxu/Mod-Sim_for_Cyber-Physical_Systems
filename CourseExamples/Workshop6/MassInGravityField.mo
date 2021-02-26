within CourseExamples.Workshop6;
model MassInGravityField
  inner Modelica.Mechanics.MultiBody.World world
    annotation (Placement(transformation(extent={{-52,12},{-32,32}})));
  Modelica.Mechanics.MultiBody.Parts.Body mass(m=1)
    annotation (Placement(transformation(extent={{2,18},{22,38}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end MassInGravityField;
