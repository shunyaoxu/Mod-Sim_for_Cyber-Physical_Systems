within CourseExamples.Workshop8.Electrical.Experiments;
model CauerLowPassFilter
  parameter Modelica.Units.SI.Capacitance i1=1.304
    "filter coefficient i1";
  parameter Modelica.Units.SI.Capacitance i2=0.8586
    "filter coefficient i2";
  parameter Modelica.Units.SI.Capacitance c1=1.072
    "filter coefficient c1";
  parameter Modelica.Units.SI.Capacitance c2=1/(1.704992^2*i1)
    "filter coefficient c2";
  parameter Modelica.Units.SI.Capacitance c3=1.682
    "filter coefficient c3";
  parameter Modelica.Units.SI.Capacitance c4=1/(1.179945^2*i2)
    "filter coefficient c4";
  parameter Modelica.Units.SI.Capacitance c5=0.7262
    "filter coefficient c5";

  Modelica.Electrical.Analog.Basic.Ground G1
    annotation (Placement(transformation(extent={{-68,-26},{-58,-16}})));
  Modelica.Electrical.Analog.Basic.Resistor R1
    annotation (Placement(transformation(extent={{-76,-6},{-64,6}})));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=c1 + c2)
    annotation (Placement(transformation(extent={{-58,28},{-46,40}})));
  Components.IdealOpAmp op1
    annotation (Placement(transformation(extent={{-62,-8},{-46,6}})));
  Modelica.Electrical.Analog.Basic.Ground G2
    annotation (Placement(transformation(extent={{-34,-26},{-24,-16}})));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=-1)
    annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=i1)
    annotation (Placement(transformation(extent={{-24,28},{-12,40}})));
  Components.IdealOpAmp op2
    annotation (Placement(transformation(extent={{-28,-8},{-12,6}})));
  Modelica.Electrical.Analog.Basic.Ground G3
    annotation (Placement(transformation(extent={{0,-26},{10,-16}})));
  Modelica.Electrical.Analog.Basic.Resistor R3
    annotation (Placement(transformation(extent={{-8,-6},{4,6}})));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C=c2 + c3 + c4)
    annotation (Placement(transformation(extent={{10,28},{22,40}})));
  Components.IdealOpAmp op3
    annotation (Placement(transformation(extent={{6,-8},{22,6}})));
  Modelica.Electrical.Analog.Basic.Ground G4
    annotation (Placement(transformation(extent={{34,-26},{44,-16}})));
  Modelica.Electrical.Analog.Basic.Resistor R4(R=-1)
    annotation (Placement(transformation(extent={{26,-6},{38,6}})));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C=i2)
    annotation (Placement(transformation(extent={{44,28},{56,40}})));
  Components.IdealOpAmp op4
    annotation (Placement(transformation(extent={{40,-8},{56,6}})));
  Modelica.Electrical.Analog.Basic.Ground G5
    annotation (Placement(transformation(extent={{68,-26},{78,-16}})));
  Modelica.Electrical.Analog.Basic.Resistor R5
    annotation (Placement(transformation(extent={{60,-6},{72,6}})));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C=c4 + c5)
    annotation (Placement(transformation(extent={{78,28},{90,40}})));
  Components.IdealOpAmp op5
    annotation (Placement(transformation(extent={{74,-8},{90,6}})));
  Modelica.Electrical.Analog.Basic.Resistor R8(R=-1)
    annotation (Placement(transformation(extent={{28,28},{40,40}})));
  Modelica.Electrical.Analog.Basic.Resistor R6
    annotation (Placement(transformation(extent={{-76,28},{-64,40}})));
  Modelica.Electrical.Analog.Basic.Resistor R7
    annotation (Placement(transformation(extent={{-58,42},{-46,54}})));
  Modelica.Electrical.Analog.Basic.Resistor R9
    annotation (Placement(transformation(extent={{78,52},{90,64}})));
  Modelica.Electrical.Analog.Basic.Capacitor C8(C=c4) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={16,62})));
  Modelica.Electrical.Analog.Basic.Capacitor C6(C=c2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-76,-36})));
  Modelica.Electrical.Analog.Basic.Capacitor C9(C=c4)
    annotation (Placement(transformation(extent={{30,-54},{42,-42}})));
  Modelica.Electrical.Analog.Basic.Capacitor C7(C=c2)
    annotation (Placement(transformation(extent={{-40,-36},{-28,-24}})));
  Modelica.Electrical.Analog.Basic.Resistor R10(R=-1)
    annotation (Placement(transformation(extent={{-52,-26},{-40,-14}})));
  Modelica.Electrical.Analog.Basic.Resistor R11
    annotation (Placement(transformation(extent={{36,48},{48,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-98,-28},{-86,-16}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{-96,-6},{-84,6}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=1,
    f=1,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-90,36})));
equation
  connect(C1.p, op1.pin_n) annotation (Line(points={{-58,34},{-59.12,34},{
          -59.12,3.48}}, color={0,0,255}));
  connect(C1.n, op1.out)
    annotation (Line(points={{-46,34},{-46,-1},{-48.88,-1}}, color={0,0,255}));
  connect(op1.pin_p, G1.p) annotation (Line(points={{-59.12,-5.48},{-63,-5.48},
          {-63,-16}}, color={0,0,255}));
  connect(R1.n, op1.pin_n) annotation (Line(points={{-64,0},{-64,8},{-59.12,8},
          {-59.12,3.48}}, color={0,0,255}));
  connect(C2.p, op2.pin_n) annotation (Line(points={{-24,34},{-25.12,34},{
          -25.12,3.48}}, color={0,0,255}));
  connect(C2.n, op2.out)
    annotation (Line(points={{-12,34},{-12,-1},{-14.88,-1}}, color={0,0,255}));
  connect(op2.pin_p, G2.p) annotation (Line(points={{-25.12,-5.48},{-29,-5.48},
          {-29,-16}}, color={0,0,255}));
  connect(R2.n, op2.pin_n) annotation (Line(points={{-30,0},{-30,8},{-25.12,8},
          {-25.12,3.48}}, color={0,0,255}));
  connect(R2.p, op1.out) annotation (Line(points={{-42,0},{-42,14},{-46,14},{
          -46,-1},{-48.88,-1}}, color={0,0,255}));
  connect(C3.p, op3.pin_n)
    annotation (Line(points={{10,34},{8.88,34},{8.88,3.48}}, color={0,0,255}));
  connect(C3.n, op3.out)
    annotation (Line(points={{22,34},{22,-1},{19.12,-1}}, color={0,0,255}));
  connect(op3.pin_p, G3.p) annotation (Line(points={{8.88,-5.48},{5,-5.48},{5,
          -16}}, color={0,0,255}));
  connect(R3.n, op3.pin_n) annotation (Line(points={{4,0},{4,8},{8.88,8},{8.88,
          3.48}}, color={0,0,255}));
  connect(R3.p, op2.out) annotation (Line(points={{-8,0},{-8,12},{-12,12},{-12,
          -1},{-14.88,-1}}, color={0,0,255}));
  connect(C4.p, op4.pin_n) annotation (Line(points={{44,34},{42.88,34},{42.88,
          3.48}}, color={0,0,255}));
  connect(C4.n, op4.out)
    annotation (Line(points={{56,34},{56,-1},{53.12,-1}}, color={0,0,255}));
  connect(op4.pin_p, G4.p) annotation (Line(points={{42.88,-5.48},{39,-5.48},{
          39,-16}}, color={0,0,255}));
  connect(R4.n, op4.pin_n) annotation (Line(points={{38,0},{38,8},{42.88,8},{
          42.88,3.48}}, color={0,0,255}));
  connect(R4.p, op3.out) annotation (Line(points={{26,0},{26,14},{22,14},{22,-1},
          {19.12,-1}}, color={0,0,255}));
  connect(C5.p, op5.pin_n) annotation (Line(points={{78,34},{76.88,34},{76.88,
          3.48}}, color={0,0,255}));
  connect(C5.n, op5.out)
    annotation (Line(points={{90,34},{90,-1},{87.12,-1}}, color={0,0,255}));
  connect(op5.pin_p, G5.p) annotation (Line(points={{76.88,-5.48},{73,-5.48},{
          73,-16}}, color={0,0,255}));
  connect(R5.n, op5.pin_n) annotation (Line(points={{72,0},{72,8},{76.88,8},{
          76.88,3.48}}, color={0,0,255}));
  connect(R5.p, op4.out) annotation (Line(points={{60,0},{60,12},{56,12},{56,-1},
          {53.12,-1}}, color={0,0,255}));
  connect(R6.n, C1.p)
    annotation (Line(points={{-64,34},{-58,34}}, color={0,0,255}));
  connect(R6.p, C2.n) annotation (Line(points={{-76,34},{-76,56},{-12,56},{-12,
          34}}, color={0,0,255}));
  connect(C1.p, R7.p) annotation (Line(points={{-58,34},{-60,34},{-60,48},{-58,
          48}}, color={0,0,255}));
  connect(R7.n, C1.n)
    annotation (Line(points={{-46,48},{-46,34}}, color={0,0,255}));
  connect(R8.n, op4.pin_n) annotation (Line(points={{40,34},{42.88,34},{42.88,
          3.48}}, color={0,0,255}));
  connect(R8.p, C8.p)
    annotation (Line(points={{28,34},{28,62},{22,62}}, color={0,0,255}));
  connect(R9.n, C5.n)
    annotation (Line(points={{90,58},{90,34}}, color={0,0,255}));
  connect(C5.p, R9.p) annotation (Line(points={{78,34},{78,50},{76,50},{76,58},
          {78,58}}, color={0,0,255}));
  connect(C6.n, R1.n) annotation (Line(points={{-76,-30},{-76,-10},{-64,-10},{
          -64,0}}, color={0,0,255}));
  connect(C6.p, op3.out) annotation (Line(points={{-76,-42},{-76,-48},{19.12,
          -48},{19.12,-1}}, color={0,0,255}));
  connect(C7.p, op1.out) annotation (Line(points={{-40,-30},{-48.88,-30},{
          -48.88,-1}}, color={0,0,255}));
  connect(C7.n, R3.n)
    annotation (Line(points={{-28,-30},{4,-30},{4,0}}, color={0,0,255}));
  connect(C8.n, C3.p)
    annotation (Line(points={{10,62},{10,34}}, color={0,0,255}));
  connect(C9.p, op3.out)
    annotation (Line(points={{30,-48},{30,-1},{19.12,-1}}, color={0,0,255}));
  connect(C9.n, R5.n)
    annotation (Line(points={{42,-48},{72,-48},{72,0}}, color={0,0,255}));
  connect(R10.p, C6.p) annotation (Line(points={{-52,-20},{-56,-20},{-56,-42},{
          -76,-42}}, color={0,0,255}));
  connect(R10.n, R2.n) annotation (Line(points={{-40,-20},{-36,-20},{-36,-18},{
          -30,-18},{-30,0}}, color={0,0,255}));
  connect(R11.p, C3.p)
    annotation (Line(points={{36,54},{0,54},{0,34},{10,34}}, color={0,0,255}));
  connect(R11.n, C4.n) annotation (Line(points={{48,54},{54,54},{54,52},{56,52},
          {56,34}}, color={0,0,255}));
  connect(C8.p, R9.n) annotation (Line(points={{22,62},{56,62},{56,64},{90,64},
          {90,58}}, color={0,0,255}));
  connect(signalVoltage.n, R1.p)
    annotation (Line(points={{-84,0},{-76,0}}, color={0,0,255}));
  connect(signalVoltage.p, ground.p)
    annotation (Line(points={{-96,0},{-96,-16},{-92,-16}}, color={0,0,255}));
  connect(sine.y, signalVoltage.v)
    annotation (Line(points={{-90,29.4},{-90,7.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=60, __Dymola_Algorithm="Dassl"));
end CauerLowPassFilter;
