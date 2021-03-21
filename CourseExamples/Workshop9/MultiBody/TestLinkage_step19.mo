within CourseExamples.Workshop9.MultiBody;
model TestLinkage_step19
  Linkage linkage
    annotation (Placement(transformation(extent={{-10,-20},{34,20}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1})
    annotation (Placement(transformation(extent={{70,70},{90,90}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=linkage.r_5)
    annotation (Placement(transformation(extent={{-84,36},{-64,56}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=10)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true, n(
        displayUnit="1") = {0,1,0})
    annotation (Placement(transformation(extent={{-42,36},{-22,56}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=true,
      exact=true)
    annotation (Placement(transformation(extent={{-50,72},{-30,92}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=0.08)
    annotation (Placement(transformation(extent={{-84,72},{-64,92}})));
equation
  connect(fixed1.frame_b, linkage.mountFrame) annotation (Line(
      points={{-64,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(linkage.uprightFrame, body.frame_a) annotation (Line(
      points={{34,0},{72,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, prismatic.frame_a) annotation (Line(
      points={{-64,46},{-42,46}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_b, linkage.steerFrame) annotation (Line(
      points={{-22,46},{-16,46},{-16,16},{-10,16}},
      color={95,95,95},
      thickness=0.5));
  connect(sine.y, position.s_ref)
    annotation (Line(points={{-63,82},{-52,82}}, color={0,0,127}));
  connect(position.flange, prismatic.axis)
    annotation (Line(points={{-30,82},{-24,82},{-24,52}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end TestLinkage_step19;
