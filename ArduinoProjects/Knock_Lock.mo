within ArduinoProjects;
model Knock_Lock
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{72,36},{92,56}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{72,16},{92,36}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{72,-4},{92,16}})));
  Arduino.Components.LED lED2
    annotation (Placement(transformation(extent={{32,36},{52,56}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={42,-34})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-138,-94},{-118,-74}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-128,6})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={120,26})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,-34})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R(displayUnit="kOhm") = 10000)
    annotation (Placement(transformation(extent={{72,-44},{92,-24}})));
  Arduino.Components.ArduinoUno arduinoUno(sketch="Project12.ino")
    annotation (Placement(transformation(extent={{-94,-22},{8,106}})));
  Green_LED lED1
    annotation (Placement(transformation(extent={{32,16},{52,36}})));
  Yellow_LED yellow_LED annotation (Placement(transformation(extent={{32,-4},{52,16}})));
  UserInteraction.Inputs.ToggleButton toggleButton(label="Lock/Unlock")
    annotation (Placement(transformation(
        extent={{-30,-6},{30,6}},
        rotation=180,
        origin={122,-12})));
  Servo_Motor servo_Motor annotation (Placement(transformation(extent={{52,86},{72,106}})));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={44,68})));
  Piezo piezo
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-78,-90})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R(displayUnit="MOhm") = 1000000)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-12,-72})));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={12,-98})));
  UserInteraction.Inputs.ToggleButton toggleButton1(label="Knock")
    annotation (Placement(transformation(
        extent={{-30,-6},{30,6}},
        rotation=180,
        origin={122,-54})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1
                                                             annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-48,-72})));
equation
  connect(ground.p,constantVoltage. n)
    annotation (Line(points={{-128,-74},{-128,-4}}, color={0,0,255}));
  connect(ground1.p,resistor1. n)
    annotation (Line(points={{110,26},{92,26}},  color={0,0,255}));
  connect(ground1.p,resistor2. n) annotation (Line(points={{110,26},{98,26},{98,6},{92,6}},
                           color={0,0,255}));
  connect(ground1.p,resistor. n) annotation (Line(points={{110,26},{98,26},{98,46},{92,46}},
                             color={0,0,255}));
  connect(resistor.p,lED2. n)
    annotation (Line(points={{72,46},{52,46}}, color={0,0,255}));
  connect(arduinoUno.GND,constantVoltage. n) annotation (Line(points={{-43,-22},{-43,-26},{-128,-26},{-128,-4}},
                                           color={0,0,255}));
  connect(lED1.p, arduinoUno.D4)
    annotation (Line(points={{32,26},{8,26}}, color={0,0,255}));
  connect(lED1.n, resistor1.p)
    annotation (Line(points={{52,26},{72,26}}, color={0,0,255}));
  connect(yellow_LED.n, resistor2.p) annotation (Line(points={{52,6},{72,6}}, color={0,0,255}));
  connect(yellow_LED.p, arduinoUno.D3) annotation (Line(points={{32,6},{32,19.6},{8,19.6}}, color={0,0,255}));
  connect(lED2.p, arduinoUno.D5) annotation (Line(points={{32,46},{32,32.4},{8,32.4}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin)
    annotation (Line(points={{-128,16},{-128,114},{-43,114},{-43,106}}, color={0,0,255}));
  connect(arduinoUno.D9, servo_Motor.basePin) annotation (Line(points={{8,58},{32,58},{32,101},{52,101}}, color={0,0,255}));
  connect(ground3.p, servo_Motor.GND1) annotation (Line(points={{44,78},{44,91},{52,91}}, color={0,0,255}));
  connect(resistor3.n, ground2.p) annotation (Line(points={{92,-34},{112,-34}}, color={0,0,255}));
  connect(resistor3.p, switch.n) annotation (Line(points={{72,-34},{52,-34}}, color={0,0,255}));
  connect(arduinoUno.D2, switch.n)
    annotation (Line(points={{8,13.2},{24,13.2},{24,-8},{62,-8},{62,-34},{52,-34}}, color={0,0,255}));
  connect(switch.p, arduinoUno.Vin)
    annotation (Line(points={{32,-34},{-114,-34},{-114,66},{-128,66},{-128,114},{-43,114},{-43,106}}, color={0,0,255}));
  connect(switch.control, toggleButton.buttonState) annotation (Line(points={{42,-22},{42,-12},{92,-12}}, color={255,0,255}));
  connect(piezo.pin_n, switch1.p) annotation (Line(points={{-74,-80},{-74,-72},{-58,-72}}, color={0,0,255}));
  connect(toggleButton1.buttonState, switch1.control)
    annotation (Line(points={{92,-54},{-48,-54},{-48,-60}}, color={255,0,255}));
  connect(switch1.n, resistor4.p) annotation (Line(points={{-38,-72},{-22,-72}}, color={0,0,255}));
  connect(resistor4.n, ground4.p) annotation (Line(points={{-2,-72},{12,-72},{12,-88}}, color={0,0,255}));
  connect(piezo.pin_p, arduinoUno.Vin) annotation (Line(points={{-82,-80},{-82,-54},{-114,-54},{-114,66},{-128,66},{-128,114},
          {-43,114},{-43,106}}, color={0,0,255}));
  connect(arduinoUno.A0, resistor4.p)
    annotation (Line(points={{-94,38.8},{-108,38.8},{-108,-48},{-32,-48},{-32,-72},{-22,-72}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-160},{180,180}})),
                                Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-180,-160},{180,180}})),
    experiment(StopTime=20, __Dymola_Algorithm="Dassl"));
end Knock_Lock;
