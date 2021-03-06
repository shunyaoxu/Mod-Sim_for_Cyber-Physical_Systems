within CourseExamples.Workshop8.Electrical.Experiments;
model IdealAmplifierCircuitOpAmp
  Components.IdealOpAmp opAmp
    annotation (Placement(transformation(extent={{10,14},{46,46}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=8, f=1000)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-54,4})));
  Modelica.Electrical.Analog.Basic.Resistor R1(R=10000)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=40000)
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Modelica.Electrical.Analog.Basic.Resistor R3(R=10000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-4})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
equation
  connect(R1.n, opAmp.pin_n)
    annotation (Line(points={{-20,40},{16.48,40.24}}, color={0,0,255}));
  connect(opAmp.pin_n, R2.p) annotation (Line(points={{16.48,40.24},{18,40.24},
          {18,60},{40,60}}, color={0,0,255}));
  connect(R2.n, R3.p)
    annotation (Line(points={{60,60},{64,60},{64,6},{40,6}}, color={0,0,255}));
  connect(opAmp.out, R3.p)
    annotation (Line(points={{39.52,30},{40,30},{40,6}}, color={0,0,255}));
  connect(ground.p, opAmp.pin_p) annotation (Line(points={{0,-32},{0,20},{16,20},
          {16,19.76},{16.48,19.76}}, color={0,0,255}));
  connect(R3.n, ground.p)
    annotation (Line(points={{40,-14},{40,-32},{0,-32}}, color={0,0,255}));
  connect(R1.p, sineVoltage.p)
    annotation (Line(points={{-40,40},{-54,40},{-54,14}}, color={0,0,255}));
  connect(sineVoltage.n, ground.p)
    annotation (Line(points={{-54,-6},{-54,-32},{0,-32}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=0.003, __Dymola_Algorithm="Dassl"));
end IdealAmplifierCircuitOpAmp;
