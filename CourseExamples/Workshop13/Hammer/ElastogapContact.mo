within CourseExamples.Workshop13.Hammer;
model ElastogapContact
  Modelica.Blocks.Sources.Sine sine(amplitude=0.1, f=10) annotation (Placement(transformation(extent={{-98,20},{-78,40}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed(s0=0.29)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,30})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=1, L=0.1)
    annotation (Placement(transformation(extent={{24,20},{44,40}})));
  Modelica.Mechanics.Translational.Components.Spring spring(c=100, s_rel0=0.1)
    annotation (Placement(transformation(extent={{64,20},{84,40}})));
  Modelica.Mechanics.Translational.Components.ElastoGap head_contact(c=1e10)
    annotation (Placement(transformation(extent={{-12,20},{8,40}})));
  Modelica.Mechanics.Translational.Sources.Position Maxwells_Sliver_Hammer(exact=false)
    annotation (Placement(transformation(extent={{-56,20},{-36,40}})));
equation
  connect(sine.y, Maxwells_Sliver_Hammer.s_ref) annotation (Line(points={{-77,30},{-58,30}}, color={0,0,127}));
  connect(Maxwells_Sliver_Hammer.flange, head_contact.flange_a)
    annotation (Line(points={{-36,30},{-12,30}}, color={0,127,0}));
  connect(head_contact.flange_b, mass.flange_a) annotation (Line(points={{8,30},{24,30}}, color={0,127,0}));
  connect(mass.flange_b, spring.flange_a) annotation (Line(points={{44,30},{64,30}}, color={0,127,0}));
  connect(spring.flange_b, fixed.flange) annotation (Line(points={{84,30},{100,30}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-120,-100},{120,100}})));
end ElastogapContact;
