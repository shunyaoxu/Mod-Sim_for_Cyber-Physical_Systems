within CourseExamples.Workshop18.ControlPerformance;
model GoodReference_PoorLoadRejection
  Modelica.Blocks.Sources.Step step(startTime=1) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Modelica.Blocks.Sources.Step step1(startTime=20) annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Blocks.Continuous.PI PI(k=1, T=50) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={1}, a={1,1.02,0.02})
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
equation
  connect(step.y, feedback.u1) annotation (Line(points={{-59,10},{-48,10}}, color={0,0,127}));
  connect(feedback.y, PI.u) annotation (Line(points={{-31,10},{-22,10}}, color={0,0,127}));
  connect(PI.y, add.u2) annotation (Line(points={{1,10},{10,10},{10,4},{18,4}}, color={0,0,127}));
  connect(step1.y, add.u1) annotation (Line(points={{1,50},{6,50},{6,16},{18,16}}, color={0,0,127}));
  connect(add.y, transferFunction.u) annotation (Line(points={{41,10},{58,10}}, color={0,0,127}));
  connect(transferFunction.y, feedback.u2)
    annotation (Line(points={{81,10},{84,10},{84,-20},{-40,-20},{-40,2}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end GoodReference_PoorLoadRejection;
