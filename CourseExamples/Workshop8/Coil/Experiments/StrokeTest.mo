within CourseExamples.Workshop8.Coil.Experiments;
model StrokeTest
  Components.Stroke stroke annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.01,
    s(fixed=true, start=0),
    v(fixed=true, start=1)) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  Components.Stroke stroke1 annotation (Placement(transformation(extent={{30,0},{50,20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
equation
  connect(fixed.flange, stroke.mount) annotation (Line(points={{-40,-20},{-40,6}}, color={0,127,0}));
  connect(stroke.flange, mass.flange_a) annotation (Line(points={{-40,14},{-40,40},{-10,40}}, color={0,127,0}));
  connect(fixed1.flange, stroke1.mount) annotation (Line(points={{40,-20},{40,6}}, color={0,127,0}));
  connect(mass.flange_b, stroke1.flange) annotation (Line(points={{10,40},{40,40},{40,14}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StrokeTest;
