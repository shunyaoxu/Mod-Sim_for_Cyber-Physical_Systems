within CourseExamples.Workshop13.HybridExamples;
model TestTermostatLogic2
  Modelica.Blocks.Sources.ExpSine expSine(
    amplitude=40,
    f=1,
    damping=0.5,
    offset=300) annotation (Placement(transformation(extent={{-78,10},{-58,30}})));
  ThermostatLogicSign thermostatLogicSign annotation (Placement(transformation(extent={{-28,10},{-8,30}})));
equation
  connect(expSine.y, thermostatLogicSign.u) annotation (Line(points={{-57,20},{-30,20}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=10,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestTermostatLogic2;
