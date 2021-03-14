within CourseExamples.Workshop9.MultiBody;
model TestLinkage_step17
  Linkage linkage(lowerInnerJoint(
      phi(start=0),
      w(start=0, fixed=true),
      a(start=0, fixed=true)))
    annotation (Placement(transformation(extent={{-18,12},{26,52}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1})
    annotation (Placement(transformation(extent={{-92,14},{-72,34}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=linkage.r_5)
    annotation (Placement(transformation(extent={{-64,38},{-44,58}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1
    annotation (Placement(transformation(extent={{-64,4},{-44,24}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=10)
    annotation (Placement(transformation(extent={{44,22},{64,42}})));
equation
  connect(fixed.frame_b, linkage.steerFrame) annotation (Line(
      points={{-44,48},{-18,48}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b, linkage.mountFrame) annotation (Line(
      points={{-44,14},{-26,14},{-26,32},{-18,32}},
      color={95,95,95},
      thickness=0.5));
  connect(linkage.uprightFrame, body.frame_a) annotation (Line(
      points={{26,32},{44,32}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=2,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end TestLinkage_step17;
