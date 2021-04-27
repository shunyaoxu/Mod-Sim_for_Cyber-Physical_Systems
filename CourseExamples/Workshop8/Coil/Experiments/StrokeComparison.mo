within CourseExamples.Workshop8.Coil.Experiments;
model StrokeComparison
  Modelica.Mechanics.Translational.Components.Mass mass1(
    m=0.01,
    s(fixed=true, start=0),
    v(fixed=true, start=1)) annotation (Placement(transformation(extent={{52,30},{72,50}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed2 annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed3 annotation (Placement(transformation(extent={{70,-30},{90,-10}})));
  Components.Stroke2 stroke2_1 annotation (Placement(transformation(extent={{30,0},{50,20}})));
  Components.Stroke2 stroke2_2 annotation (Placement(transformation(extent={{70,0},{90,20}})));
  Components.Stroke stroke annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.01,
    s(fixed=true, start=0),
    v(fixed=true, start=1)) annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  Components.Stroke stroke1 annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
equation
  connect(stroke2_1.flange, mass1.flange_a) annotation (Line(points={{40,14},{40,40},{52,40}}, color={0,127,0}));
  connect(mass1.flange_b, stroke2_2.flange) annotation (Line(points={{72,40},{80,40},{80,14}}, color={0,127,0}));
  connect(stroke2_2.mount, fixed3.flange) annotation (Line(points={{80,5.8},{80,-20}}, color={0,127,0}));
  connect(stroke2_1.mount, fixed2.flange) annotation (Line(points={{40,5.8},{40,-20}}, color={0,127,0}));
  connect(fixed.flange, stroke.mount) annotation (Line(points={{-80,-20},{-80,6}}, color={0,127,0}));
  connect(stroke.flange, mass.flange_a) annotation (Line(points={{-80,14},{-80,40},{-70,40}}, color={0,127,0}));
  connect(fixed1.flange, stroke1.mount) annotation (Line(points={{-40,-20},{-40,6}}, color={0,127,0}));
  connect(mass.flange_b, stroke1.flange) annotation (Line(points={{-50,40},{-40,40},{-40,14}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StrokeComparison;
