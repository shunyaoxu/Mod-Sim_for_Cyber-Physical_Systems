within CourseExamples.Workshop18.ControlPerformance;
model OneDOF_TwoDOF
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=1, T=1) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.002, sigma=0)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Modelica.Blocks.Sources.Step step(startTime=1) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Step step1(startTime=5) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=0.4)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=4.75,
    Ti=0.48,
    Td=0.084,
    yMax=100,
    wp=0.6,
    wd=0.6) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
equation
  connect(step1.y, add.u1) annotation (Line(points={{-59,70},{-48,70},{-48,36},{-42,36}},color={0,0,127}));
  connect(add.y, firstOrder.u) annotation (Line(points={{-19,30},{-2,30}},color={0,0,127}));
  connect(normalNoise.y, add1.u1) annotation (Line(points={{61,70},{68,70},{68,36},{78,36}}, color={0,0,127}));
  connect(step.y, PID.u_s) annotation (Line(points={{-99,30},{-82,30}}, color={0,0,127}));
  connect(firstOrder.y, fixedDelay.u) annotation (Line(points={{21,30},{38,30}}, color={0,0,127}));
  connect(fixedDelay.y, add1.u2) annotation (Line(points={{61,30},{70,30},{70,24},{78,24}}, color={0,0,127}));
  connect(add1.y, PID.u_m) annotation (Line(points={{101,30},{106,30},{106,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(PID.y, add.u2) annotation (Line(points={{-59,30},{-50,30},{-50,24},{-42,24}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end OneDOF_TwoDOF;
