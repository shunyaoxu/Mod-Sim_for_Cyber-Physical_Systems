within ArduinoProjects;
model Knock_Lock_Test
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{88,34},{108,54}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{88,14},{108,34}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{88,-6},{108,14}})));
  Arduino.Components.LED lED2
    annotation (Placement(transformation(extent={{48,34},{68,54}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={58,-36})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-122,-96},{-102,-76}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-112,4})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={136,24})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={138,-36})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R(displayUnit="kOhm") = 10000)
    annotation (Placement(transformation(extent={{88,-46},{108,-26}})));
  Green_LED lED1
    annotation (Placement(transformation(extent={{48,14},{68,34}})));
  Yellow_LED yellow_LED annotation (Placement(transformation(extent={{48,-6},{68,14}})));
  UserInteraction.Inputs.ToggleButton toggleButton(label="Lock/Unlock")
    annotation (Placement(transformation(
        extent={{-30,-6},{30,6}},
        rotation=180,
        origin={138,-14})));
  Servo_Motor servo_Motor annotation (Placement(transformation(extent={{68,84},{88,104}})));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,66})));
  Piezo piezo
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-62,-92})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R(displayUnit="MOhm") = 1000000)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,-74})));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,-100})));
  UserInteraction.Inputs.ToggleButton toggleButton1(label="Knock")
    annotation (Placement(transformation(
        extent={{-30,-6},{30,6}},
        rotation=180,
        origin={138,-56})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1
                                                             annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,-74})));
equation
  connect(ground.p,constantVoltage. n)
    annotation (Line(points={{-112,-76},{-112,-6}}, color={0,0,255}));
  connect(ground1.p,resistor1. n)
    annotation (Line(points={{126,24},{108,24}}, color={0,0,255}));
  connect(ground1.p,resistor2. n) annotation (Line(points={{126,24},{114,24},{114,4},{108,4}},
                           color={0,0,255}));
  connect(ground1.p,resistor. n) annotation (Line(points={{126,24},{114,24},{114,44},{108,44}},
                             color={0,0,255}));
  connect(resistor.p,lED2. n)
    annotation (Line(points={{88,44},{68,44}}, color={0,0,255}));
  connect(lED1.n,resistor1. p)
    annotation (Line(points={{68,24},{88,24}}, color={0,0,255}));
  connect(yellow_LED.n, resistor2.p) annotation (Line(points={{68,4},{88,4}}, color={0,0,255}));
  connect(ground3.p, servo_Motor.GND1) annotation (Line(points={{60,76},{60,89},{68,89}}, color={0,0,255}));
  connect(resistor3.n, ground2.p) annotation (Line(points={{108,-36},{128,-36}}, color={0,0,255}));
  connect(resistor3.p, switch.n) annotation (Line(points={{88,-36},{68,-36}}, color={0,0,255}));
  connect(switch.control, toggleButton.buttonState)
    annotation (Line(points={{58,-24},{58,-14},{108,-14}}, color={255,0,255}));
  connect(piezo.pin_n, switch1.p) annotation (Line(points={{-58,-82},{-58,-74},{-42,-74}}, color={0,0,255}));
  connect(toggleButton1.buttonState, switch1.control)
    annotation (Line(points={{108,-56},{-32,-56},{-32,-62}}, color={255,0,255}));
  connect(switch1.n, resistor4.p) annotation (Line(points={{-22,-74},{-6,-74}}, color={0,0,255}));
  connect(resistor4.n, ground4.p) annotation (Line(points={{14,-74},{28,-74},{28,-90}}, color={0,0,255}));
  connect(constantVoltage.p, servo_Motor.basePin) annotation (Line(points={{-112,14},{-112,99},{68,99}}, color={0,0,255}));
  connect(lED2.p, servo_Motor.basePin) annotation (Line(points={{48,44},{40,44},{40,99},{68,99}}, color={0,0,255}));
  connect(lED1.p, servo_Motor.basePin) annotation (Line(points={{48,24},{40,24},{40,99},{68,99}}, color={0,0,255}));
  connect(yellow_LED.p, servo_Motor.basePin) annotation (Line(points={{48,4},{40,4},{40,99},{68,99}}, color={0,0,255}));
  connect(switch.p, servo_Motor.basePin) annotation (Line(points={{48,-36},{40,-36},{40,99},{68,99}}, color={0,0,255}));
  connect(piezo.pin_p, servo_Motor.basePin) annotation (Line(points={{-66,-82},{-66,99},{68,99}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-180},{180,180}})), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-180,-180},{180,180}})));
end Knock_Lock_Test;
