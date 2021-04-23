within CourseExamples.Workshop15;
model AccelerationOutput
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Sources.Sine sineAcc(f=1) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(sineAcc.y, y) annotation (Line(points={{41,0},{100,0},{100,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end AccelerationOutput;
