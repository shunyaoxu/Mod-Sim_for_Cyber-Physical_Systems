within CourseExamples.Workshop8.Coil.Components;
model Stroke2
  Modelica.Mechanics.Translational.Components.ElastoGap stopB(c=c, d=d,
    s_rel0=s_rel0)                                            annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Mechanics.Translational.Components.ElastoGap stopA(c=c, d=d,
    s_rel0=s_rel0)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a mount
    annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
  parameter Modelica.Units.SI.TranslationalSpringConstant c=1e5 "Spring constant";
  parameter Modelica.Units.SI.TranslationalDampingConstant d=10 "Damping constant";
  parameter Modelica.Units.SI.Position s_rel0=0.01 "Unstretched spring length";
equation
  connect(stopA.flange_b, stopB.flange_a) annotation (Line(points={{-20,20},{20,20}}, color={0,127,0}));
  connect(flange, stopB.flange_a) annotation (Line(points={{0,40},{0,20},{20,20}}, color={0,127,0}));
  connect(mount, mount) annotation (Line(points={{0,-42},{0,-42}}, color={0,127,0}));
  connect(stopB.flange_b, stopA.flange_a)
    annotation (Line(points={{40,20},{50,20},{50,-20},{-50,-20},{-50,20},{-40,20}}, color={0,127,0}));
  connect(mount, stopA.flange_a) annotation (Line(points={{0,-42},{0,-20},{-50,-20},{-50,20},{-40,20}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Stroke2;
