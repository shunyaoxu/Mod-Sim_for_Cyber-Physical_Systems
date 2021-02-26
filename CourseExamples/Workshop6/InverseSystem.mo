within CourseExamples.Workshop6;
model InverseSystem
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-66,48},{-46,68}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.1)
    annotation (Placement(transformation(extent={{-36,48},{-16,68}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=10, d=
        0.1) annotation (Placement(transformation(extent={{-6,48},{14,68}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=1)
    annotation (Placement(transformation(extent={{24,48},{44,68}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{52,48},{72,68}})));
  Modelica.Blocks.Sources.ExpSine expSine(f=2, damping=0.5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={58,16})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent={{-30,6},{-68,30}})));
equation
  connect(torque.flange, inertia.flange_a)
    annotation (Line(points={{-46,58},{-36,58}}, color={0,0,0}));
  connect(inertia.flange_b, springDamper.flange_a)
    annotation (Line(points={{-16,58},{-6,58}}, color={0,0,0}));
  connect(springDamper.flange_b, inertia1.flange_a)
    annotation (Line(points={{14,58},{24,58}}, color={0,0,0}));
  connect(inertia1.flange_b, angleSensor.flange)
    annotation (Line(points={{44,58},{52,58}}, color={0,0,0}));
  connect(torque.tau, inverseBlockConstraints.y2) annotation (Line(points={{-68,
          58},{-76,58},{-76,24},{-60,24},{-60,18},{-65.15,18}}, color={0,0,127}));
  connect(angleSensor.phi, inverseBlockConstraints.u2) annotation (Line(points=
          {{73,58},{76,58},{76,38},{-44,38},{-44,18},{-33.8,18}}, color={0,0,
          127}));
  connect(expSine.y, inverseBlockConstraints.u1) annotation (Line(points={{47,
          16},{-22,16},{-22,18},{-28.1,18}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end InverseSystem;
