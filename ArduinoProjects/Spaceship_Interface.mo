within ArduinoProjects;
model Spaceship_Interface
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=40)
    annotation (Placement(transformation(extent={{80,70},{100,90}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=40)
    annotation (Placement(transformation(extent={{80,30},{100,50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=40)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Arduino.Components.LED lED1
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Arduino.Components.LED lED2
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50, period=4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-26})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-110,-80},{-90,-60}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=5)
    annotation (Placement(transformation(extent={{82,-36},{102,-16}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={128,40})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={130,-26})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=10000)
    annotation (Placement(transformation(extent={{-18,-36},{2,-16}})));
  Arduino.Components.ArduinoUno arduinoUno(sketch="Project2.ino")
    annotation (Placement(transformation(extent={{-86,-8},{16,120}})));
  Green_LED lED
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{-100,-60},{-100,20}}, color={0,0,255}));
  connect(resistor3.p, constantVoltage.n) annotation (Line(points={{-18,-26},{
          -100,-26},{-100,20}}, color={0,0,255}));
  connect(switch.n, resistor3.n)
    annotation (Line(points={{40,-26},{2,-26}}, color={0,0,255}));
  connect(constantVoltage1.p, switch.p)
    annotation (Line(points={{82,-26},{60,-26}}, color={0,0,255}));
  connect(ground2.p, constantVoltage1.n)
    annotation (Line(points={{120,-26},{102,-26}}, color={0,0,255}));
  connect(ground1.p, resistor1.n)
    annotation (Line(points={{118,40},{100,40}}, color={0,0,255}));
  connect(booleanPulse.y, switch.control)
    annotation (Line(points={{50,-59},{50,-38}}, color={255,0,255}));
  connect(ground1.p, resistor2.n) annotation (Line(points={{118,40},{106,40},{
          106,0},{100,0}}, color={0,0,255}));
  connect(ground1.p, resistor.n) annotation (Line(points={{118,40},{106,40},{
          106,80},{100,80}}, color={0,0,255}));
  connect(resistor.p, lED2.n)
    annotation (Line(points={{80,80},{60,80}}, color={0,0,255}));
  connect(resistor1.p, lED1.n)
    annotation (Line(points={{80,40},{60,40}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-100,40},
          {-100,120},{-35,120}}, color={0,0,255}));
  connect(arduinoUno.GND, constantVoltage.n) annotation (Line(points={{-35,-8},
          {-35,-26},{-100,-26},{-100,20}}, color={0,0,255}));
  connect(arduinoUno.D2, resistor3.n) annotation (Line(points={{16,27.2},{26,
          27.2},{26,-26},{2,-26}}, color={0,0,255}));
  connect(lED1.p, arduinoUno.D4)
    annotation (Line(points={{40,40},{16,40}}, color={0,0,255}));
  connect(lED2.p, arduinoUno.D5) annotation (Line(points={{40,80},{22,80},{22,
          46.4},{16,46.4}}, color={0,0,255}));
  connect(lED.n, resistor2.p)
    annotation (Line(points={{60,0},{80,0}}, color={0,0,255}));
  connect(lED.p, arduinoUno.D3) annotation (Line(points={{40,0},{28,0},{28,33.6},
          {16,33.6}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{
            140,140}})),
    experiment(
      StopTime=10,
      Interval=0.001,
      __Dymola_Algorithm="Dassl"));
end Spaceship_Interface;
