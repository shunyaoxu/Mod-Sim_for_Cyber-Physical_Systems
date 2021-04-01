within CourseExamples.Workshop12.Experiments;
model ThrottleTest
  Configurations.SimpleCar simpleCar annotation (Placement(transformation(extent={{38,-2},{62,22}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-12,0},{8,20}})));
equation
  connect(const.y, simpleCar.throttle) annotation (Line(points={{9,10},{38.6,10.2}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end ThrottleTest;
