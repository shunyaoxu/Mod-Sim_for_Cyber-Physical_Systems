within CourseExamples.Workshop8.Coil.Components;
model Stroke
  Modelica.Mechanics.Translational.Components.ElastoGap stopB(c=c, d=d)
                                                              annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Mechanics.Translational.Components.ElastoGap stopA(c=c, d=d)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Mechanics.Translational.Components.Rod toStopB(L=s_b)
                                                          annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Mechanics.Translational.Components.Rod toStopA(L=-s_a)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a mount
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  parameter Modelica.Units.SI.Length s_a=-0.01
    "Length of component, from left flange to right flange (= flange_b.s - flange_a.s)";
  parameter Modelica.Units.SI.Length s_b=0.01
    "Length of component, from left flange to right flange (= flange_b.s - flange_a.s)";
  parameter Modelica.Units.SI.TranslationalSpringConstant c=1e5 "Spring constant";
  parameter Modelica.Units.SI.TranslationalDampingConstant d=10 "Damping constant";
equation
  connect(stopA.flange_a, toStopA.flange_a)
    annotation (Line(points={{-40,20},{-60,20},{-60,-20},{-40,-20}}, color={0,127,0}));
  connect(stopA.flange_b, stopB.flange_a) annotation (Line(points={{-20,20},{20,20}}, color={0,127,0}));
  connect(stopB.flange_b, toStopB.flange_b) annotation (Line(points={{40,20},{60,20},{60,-20},{40,-20}}, color={0,127,0}));
  connect(toStopB.flange_a, toStopA.flange_b) annotation (Line(points={{20,-20},{-20,-20}}, color={0,127,0}));
  connect(flange, stopB.flange_a) annotation (Line(points={{0,40},{0,20},{20,20}}, color={0,127,0}));
  connect(mount, mount) annotation (Line(points={{0,-40},{0,-40}}, color={0,127,0}));
  connect(mount, toStopA.flange_b) annotation (Line(points={{0,-40},{0,-20},{-20,-20}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Stroke;
