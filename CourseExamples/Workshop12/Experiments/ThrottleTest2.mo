within CourseExamples.Workshop12.Experiments;
model ThrottleTest2
  Configurations.SimpleCar simpleCar annotation (Placement(transformation(extent={{0,-24},{24,0}})));
  Configurations.SportsCar sportsCar annotation (Placement(transformation(extent={{0,20},{24,44}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0.2; 2,1; 3,1; 10,0.2])
    annotation (Placement(transformation(extent={{-50,22},{-30,42}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,0.2; 2,1; 3,1; 10,0.2])
    annotation (Placement(transformation(extent={{-50,-22},{-30,-2}})));
equation
  connect(timeTable.y, sportsCar.throttle) annotation (Line(points={{-29,32},{0.6,32.2}}, color={0,0,127}));
  connect(timeTable1.y, simpleCar.throttle) annotation (Line(points={{-29,-12},{0.6,-11.8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ThrottleTest2;
