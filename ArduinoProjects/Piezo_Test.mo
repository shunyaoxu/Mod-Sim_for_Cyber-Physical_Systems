within ArduinoProjects;
model Piezo_Test
  Piezo piezo annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R(displayUnit="MOhm") = 1000000)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-2,26})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(extent={{8,-8},{28,12}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={16,60})));
equation
  connect(piezo.pin_n, resistor.p) annotation (Line(points={{-20,26},{-12,26}}, color={0,0,255}));
  connect(resistor.n, ground.p) annotation (Line(points={{8,26},{18,26},{18,12}}, color={0,0,255}));
  connect(constantVoltage.p, piezo.pin_p) annotation (Line(points={{6,60},{-20,60},{-20,34}}, color={0,0,255}));
  connect(constantVoltage.n, ground.p) annotation (Line(points={{26,60},{30,60},{30,12},{18,12}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Piezo_Test;
