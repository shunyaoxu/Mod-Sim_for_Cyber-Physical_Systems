within ArduinoProjects;
model Servo_Test
  Servo_Motor servo_Motor annotation (Placement(transformation(extent={{18,22},{38,42}})));
  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=5,
    width=50,
    period=0.1,
    offset=0,
    startTime=0) annotation (Placement(transformation(extent={{-36,12},{-16,32}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,-32})));
equation
  connect(pulseVoltage.p, servo_Motor.basePin)
    annotation (Line(points={{-36,22},{-40,22},{-40,37},{18,37}}, color={0,0,255}));
  connect(pulseVoltage.n, servo_Motor.GND1) annotation (Line(points={{-16,22},{-16,-12},{18,-12},{18,27}}, color={0,0,255}));
  connect(ground1.p, servo_Motor.GND1)
    annotation (Line(points={{6,-32},{-2,-32},{-2,-22},{-8,-22},{-8,-12},{18,-12},{18,27}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Servo_Test;
