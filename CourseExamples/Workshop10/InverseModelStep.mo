within CourseExamples.Workshop10;
model InverseModelStep
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia annotation (Placement(transformation(extent={{-38,44},{-18,64}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{-18,20},{2,40}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(
        extent={{-53,-30},{53,30}},
        rotation=180,
        origin={-29,30})));
  Modelica.Blocks.Sources.Step step(startTime=0.5) annotation (Placement(transformation(extent={{26,40},{46,60}})));
equation
  connect(inverseBlockConstraints.y2, torque.tau) annotation (Line(points={{-74.05,30},{-60,30}}, color={0,0,127}));
  connect(torque.flange, inertia.flange_a) annotation (Line(points={{-38,30},{-38,54}}, color={0,0,0}));
  connect(inertia.flange_b, speedSensor.flange) annotation (Line(points={{-18,54},{-18,30}}, color={0,0,0}));
  connect(speedSensor.w, inverseBlockConstraints.u2) annotation (Line(points={{3,30},{13.4,30}}, color={0,0,127}));
  connect(step.y, inverseBlockConstraints.u1) annotation (Line(points={{47,50},{60,50},{60,30},{29.3,30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end InverseModelStep;
