within CourseExamples.Workshop8.Electrical.Components;
model IdealOpAmp
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-74,-74},{-54,-54}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out
    annotation (Placement(transformation(extent={{54,-10},{74,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-74,54},{-54,74}})));

equation
  pin_n.v = pin_p.v;
  pin_n.i = 0;
  pin_p.i = 0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Polygon(points={{-50,80},{-50,-80},{50,0},{-50,80}}, lineColor={28,
              108,200}), Text(
          extent={{-38,20},{26,-38}},
          textColor={28,108,200},
          textString="%name
")}),                                                            Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealOpAmp;
