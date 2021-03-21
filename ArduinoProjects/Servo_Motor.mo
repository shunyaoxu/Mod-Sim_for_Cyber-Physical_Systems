within ArduinoProjects;
model Servo_Motor
  Modelica.Electrical.Analog.Interfaces.PositivePin basePin "positive pin"
    annotation (Placement(transformation(extent={{-110,40},{-90,60}}),
        iconTransformation(extent={{-110,40},{-90,60}})));
  Arduino.Components.Servo servo annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin GND1
                                                        "Negative armature pin"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}}),
        iconTransformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape(r(displayUnit="mm") = {0,0.05,0}, animation=false)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,-20})));
  Modelica.Mechanics.MultiBody.Joints.Revolute baseRevolute(
    n={0,1,0},
    cylinderLength(displayUnit="mm") = 0.01,
    cylinderDiameter(displayUnit="mm") = 0.01,
    useAxisFlange=true,
    phi(start=0)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,10})));
  Arduino.Components.BodyShape
                       bodyShape(
    shapeType="modelica://Arduino/Resources/Shapes/I_Rotative_Base_Main_4Servo__7.wrl",
    angles={-90,0,0},
    color={100,100,100},
    r(displayUnit="mm"))
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,-1,0})
    annotation (Placement(transformation(extent={{-64,-60},{-44,-40}})));
  Modelica.Mechanics.Rotational.Components.Disc disc4(deltaPhi=0)
    annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
  Arduino.Components.BodyShape
                       bodyShape1(
    angles={-90,0,0},
    color={100,100,100},
    r(displayUnit="mm"),
    shapeType="modelica://Arduino/Resources/Shapes/I_Rotative_Base_Top_4Servo__9.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Rotative_Base_Top_4Servo__9.png")
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
equation
  connect(basePin, servo.SIG) annotation (Line(points={{-100,50},{-80,50},{-80,14},{-60,14}}, color={0,0,255}));
  connect(GND1, servo.GND) annotation (Line(points={{-100,-60},{-80,-60},{-80,6},{-60,6}}, color={0,0,255}));
  connect(baseRevolute.frame_a,baseBodyShape. frame_b) annotation (Line(
      points={{16,0},{16,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape.frame_a,baseBodyShape. frame_a) annotation (Line(
      points={{80,-50},{16,-50},{16,-30}},
      color={95,95,95},
      thickness=0.5));
  connect(world.frame_b,baseBodyShape. frame_a) annotation (Line(
      points={{-44,-50},{16,-50},{16,-30}},
      color={95,95,95},
      thickness=0.5));
  connect(disc4.flange_b,baseRevolute. axis)
    annotation (Line(points={{-4,10},{6,10}},        color={0,0,0}));
  connect(servo.flange, disc4.flange_a) annotation (Line(points={{-40.1,9.9},{-24,9.9},{-24,10}}, color={0,0,0}));
  connect(bodyShape1.frame_a, baseRevolute.frame_b) annotation (Line(
      points={{80,30},{16,30},{16,20}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Servo_Motor;
