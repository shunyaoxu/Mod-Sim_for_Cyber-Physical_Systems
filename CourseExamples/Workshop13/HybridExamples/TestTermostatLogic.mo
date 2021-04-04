within CourseExamples.Workshop13.HybridExamples;
model TestTermostatLogic
  ThermostatLogic thermostatLogic annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  Modelica.Blocks.Sources.ExpSine expSine(
    amplitude=40,
    f=1,
    damping=0.5,
    offset=300) annotation (Placement(transformation(extent={{-78,10},{-58,30}})));
equation
  connect(expSine.y, thermostatLogic.u) annotation (Line(points={{-57,20},{-32,20}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=10,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestTermostatLogic;
