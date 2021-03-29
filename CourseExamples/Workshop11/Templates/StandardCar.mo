within CourseExamples.Workshop11.Templates;
partial model StandardCar
  replaceable Interfaces.Engine engine annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
  replaceable Interfaces.Transmission transmission annotation (Placement(transformation(extent={{-32,-8},{-12,12}})));
  replaceable Interfaces.Shaft shaft annotation (Placement(transformation(extent={{14,-8},{34,12}})));
  replaceable Interfaces.Chassis chassis annotation (Placement(transformation(extent={{54,-8},{74,12}})));
equation
  connect(engine.transmissionFlange, transmission.engineFlange) annotation (Line(points={{-58,2},{-32,2}}, color={0,0,0}));
  connect(transmission.drivelineFlange, shaft.flange_a) annotation (Line(points={{-12,2},{14,2}}, color={0,0,0}));
  connect(shaft.flange_b, chassis.drivelineFlange) annotation (Line(points={{34,2},{54,1.9}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StandardCar;
