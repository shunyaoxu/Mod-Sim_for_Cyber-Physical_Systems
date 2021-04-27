within CourseExamples.Workshop8.Coil.Experiments;
model MagneticForceTest
  Components.Stroke stroke annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.01,
    s(fixed=true, start=0),
    v(fixed=true, start=0)) annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Magnetic.FluxTubes.Shapes.Force.HollowCylinderRadialFlux flux(
    useSupport=true,
    mu_r=1.05,
    dlBydx=1,
    l=max(0.001, 0.021 - stroke.flange.s),
    r_i=0.01,
    r_o=0.02)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={0,40})));
  Modelica.Magnetic.FluxTubes.Sources.ConstantMagneticPotentialDifference magnetic(V_m=1500)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Magnetic.FluxTubes.Shapes.Leakage.HalfCylinder leakage(l=0.04)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,40})));
  Modelica.Magnetic.FluxTubes.Basic.Ground magneticground annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Mechanics.Translational.Sources.ForceStep load(
    useSupport=true,
    stepForce=1,
    offsetForce=-1,
    startTime=0.25) annotation (Placement(transformation(extent={{90,30},{70,50}})));
equation
  connect(fixed.flange, stroke.mount) annotation (Line(points={{30,-20},{30,6}}, color={0,127,0}));
  connect(stroke.flange, mass.flange_a) annotation (Line(points={{30,14},{30,40},{40,40}}, color={0,127,0}));
  connect(flux.flange, mass.flange_a) annotation (Line(points={{10,40},{40,40}}, color={0,127,0}));
  connect(mass.flange_b, load.flange) annotation (Line(points={{60,40},{70,40}}, color={0,127,0}));
  connect(load.support, stroke.mount) annotation (Line(points={{80,30},{80,-8},{30,-8},{30,6}}, color={0,127,0}));
  connect(flux.support, stroke.mount) annotation (Line(points={{-10,40},{-10,-8},{30,-8},{30,6}}, color={0,127,0}));
  connect(leakage.port_n, magneticground.port) annotation (Line(points={{-60,30},{-60,10}}, color={255,127,0}));
  connect(leakage.port_p, magnetic.port_p) annotation (Line(points={{-60,50},{-60,60},{-40,60}}, color={255,127,0}));
  connect(magnetic.port_n, flux.port_n) annotation (Line(points={{-20,60},{0,60},{0,50}}, color={255,127,0}));
  connect(flux.port_p, magneticground.port) annotation (Line(points={{0,30},{0,20},{-60,20},{-60,10}}, color={255,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MagneticForceTest;
