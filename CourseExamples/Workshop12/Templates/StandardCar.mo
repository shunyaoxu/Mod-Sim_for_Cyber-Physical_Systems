within CourseExamples.Workshop12.Templates;
partial model StandardCar
  replaceable Interfaces.Engine engine annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
  replaceable Interfaces.Transmission transmission annotation (Placement(transformation(extent={{-32,-8},{-12,12}})));
  replaceable Interfaces.Shaft shaft annotation (Placement(transformation(extent={{14,-8},{34,12}})));
  replaceable Interfaces.Chassis chassis annotation (Placement(transformation(extent={{54,-8},{74,12}})));
  replaceable parameter Data.Records.VehicleData data
    annotation (Placement(transformation(extent={{-80,44},{-60,64}})), __Dymola_choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealInput throttle annotation (Placement(transformation(extent={{-134,-18},{-94,22}})));
equation
  connect(engine.transmissionFlange, transmission.engineFlange) annotation (Line(points={{-58,2},{-32,2}}, color={0,0,0}));
  connect(transmission.drivelineFlange, shaft.flange_a) annotation (Line(points={{-12,2},{14,2}}, color={0,0,0}));
  connect(shaft.flange_b, chassis.drivelineFlange) annotation (Line(points={{34,2},{54,1.9}}, color={0,0,0}));
  connect(engine.throttle, throttle) annotation (Line(points={{-78.6,2},{-114,2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,100}})),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-120,-100},{100,100}})));
end StandardCar;
