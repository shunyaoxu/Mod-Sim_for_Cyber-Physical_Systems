within CourseExamples.Workshop18.Linearization;
model Experiment_nonlinear
  replaceable HeatingSystem_nonlinear plant constrainedby HeatingSystem_interface
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Step step(height=0.1, startTime=6e3)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Step step1(height=30, startTime=1e3)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
equation
  connect(step1.y, plant.dQ_flow) annotation (Line(points={{-39,50},{-30,50},{-30,37.6},{-11,37.6}}, color={0,0,127}));
  connect(step.y, plant.du) annotation (Line(points={{-39,-10},{-30,-10},{-30,23.6},{-11,23.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Experiment_nonlinear;
