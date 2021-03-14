within ArduinoProjects;
model Spaceship_Interface_Test
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{80,90},{100,110}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{80,10},{100,30}})));
  Arduino.Components.LED lED1
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Arduino.Components.LED lED2
    annotation (Placement(transformation(extent={{40,90},{60,110}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50, period=4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-50})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-6})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,50})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=5)
    annotation (Placement(transformation(extent={{82,-16},{102,4}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={128,60})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={130,-6})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=10000)
    annotation (Placement(transformation(extent={{-18,-16},{2,4}})));
  LED lED annotation (Placement(transformation(extent={{40,10},{60,30}})));
equation
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{-100,-40},{-100,40}}, color={0,0,255}));
  connect(resistor3.p, constantVoltage.n)
    annotation (Line(points={{-18,-6},{-100,-6},{-100,40}}, color={0,0,255}));
  connect(switch.n, resistor3.n)
    annotation (Line(points={{40,-6},{2,-6}}, color={0,0,255}));
  connect(constantVoltage1.p, switch.p)
    annotation (Line(points={{82,-6},{60,-6}}, color={0,0,255}));
  connect(ground2.p, constantVoltage1.n)
    annotation (Line(points={{120,-6},{102,-6}}, color={0,0,255}));
  connect(ground1.p, resistor1.n)
    annotation (Line(points={{118,60},{100,60}}, color={0,0,255}));
  connect(booleanPulse.y, switch.control)
    annotation (Line(points={{50,-39},{50,-18}}, color={255,0,255}));
  connect(ground1.p, resistor2.n) annotation (Line(points={{118,60},{106,60},{
          106,20},{100,20}}, color={0,0,255}));
  connect(ground1.p, resistor.n) annotation (Line(points={{118,60},{106,60},{
          106,100},{100,100}}, color={0,0,255}));
  connect(resistor.p, lED2.n)
    annotation (Line(points={{80,100},{60,100}}, color={0,0,255}));
  connect(resistor1.p, lED1.n)
    annotation (Line(points={{80,60},{60,60}}, color={0,0,255}));
  connect(constantVoltage.p, lED2.p)
    annotation (Line(points={{-100,60},{-100,100},{40,100}}, color={0,0,255}));
  connect(lED1.p, lED2.p) annotation (Line(points={{40,60},{26,60},{26,100},{40,
          100}}, color={0,0,255}));
  connect(lED.n, resistor2.p)
    annotation (Line(points={{60,20},{80,20}}, color={0,0,255}));
  connect(lED.p, lED2.p) annotation (Line(points={{40,20},{26,20},{26,100},{40,
          100}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{
            140,140}})),
    experiment(
      StopTime=60,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end Spaceship_Interface_Test;
