within ArduinoProjects;
model Piezo
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C(displayUnit="F") = 0.0001)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I=0.046)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,80})));
equation
  connect(capacitor.n, pin_p) annotation (Line(points={{10,60},{20,60},{20,40},{100,40}}, color={0,0,255}));
  connect(resistor.n, pin_p) annotation (Line(points={{10,40},{100,40}}, color={0,0,255}));
  connect(capacitor.p, pin_n) annotation (Line(points={{-10,60},{-20,60},{-20,-40},{100,-40}}, color={0,0,255}));
  connect(resistor.p, pin_n) annotation (Line(points={{-10,40},{-20,40},{-20,-40},{100,-40}}, color={0,0,255}));
  connect(constantCurrent.n, pin_p) annotation (Line(points={{10,80},{20,80},{20,40},{100,40}}, color={0,0,255}));
  connect(constantCurrent.p, pin_n) annotation (Line(points={{-10,80},{-20,80},{-20,-40},{100,-40}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end Piezo;
