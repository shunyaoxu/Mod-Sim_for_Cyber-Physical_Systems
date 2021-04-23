within CourseExamples.Workshop18.ControlPerformance;
model GoodReferenceLoad_PoorNoiseRejection
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=1, T=1) annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.002, sigma=0.05)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Step step(startTime=1) annotation (Placement(transformation(extent={{-110,20},{-90,40}})));
  Modelica.Blocks.Sources.Step step1(startTime=5) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Math.Gain gain(k=100) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{80,20},{100,40}})));
equation
  connect(step.y, feedback.u1) annotation (Line(points={{-89,30},{-78,30}}, color={0,0,127}));
  connect(feedback.y, gain.u) annotation (Line(points={{-61,30},{-42,30},{-42,30}}, color={0,0,127}));
  connect(gain.y, add.u2) annotation (Line(points={{-19,30},{-12,30},{-12,24},{-2,24}}, color={0,0,127}));
  connect(step1.y, add.u1) annotation (Line(points={{-19,70},{-12,70},{-12,36},{-2,36}}, color={0,0,127}));
  connect(add.y, firstOrder.u) annotation (Line(points={{21,30},{38,30}}, color={0,0,127}));
  connect(firstOrder.y, add1.u2) annotation (Line(points={{61,30},{68,30},{68,24},{78,24}}, color={0,0,127}));
  connect(normalNoise.y, add1.u1) annotation (Line(points={{61,70},{68,70},{68,36},{78,36}}, color={0,0,127}));
  connect(add1.y, feedback.u2) annotation (Line(points={{101,30},{110,30},{110,0},{-70,0},{-70,22}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
    experiment(StopTime=5, __Dymola_Algorithm="Dassl"));
end GoodReferenceLoad_PoorNoiseRejection;
