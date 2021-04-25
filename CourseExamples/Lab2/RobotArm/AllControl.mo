within CourseExamples.Lab2.RobotArm;
model AllControl
  Subsystem Gripper annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Subsystem WristRotation annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Subsystem WristVertical annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Subsystem Elbow annotation (Placement(transformation(extent={{80,70},{100,90}})));
  Subsystem Shoulder annotation (Placement(transformation(extent={{80,10},{100,30}})));
  Subsystem Base annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  UserInteraction.Inputs.Slider slider(min=0, max=73) annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
  UserInteraction.Inputs.Slider slider1(min=0, max=180) annotation (Placement(transformation(extent={{-120,0},{-80,40}})));
  UserInteraction.Inputs.Slider slider2(min=0, max=65) annotation (Placement(transformation(extent={{-120,-60},{-80,-20}})));
  UserInteraction.Inputs.Slider slider3(min=0, max=180) annotation (Placement(transformation(extent={{20,60},{60,100}})));
  UserInteraction.Inputs.Slider slider4(min=0, max=165) annotation (Placement(transformation(extent={{20,0},{60,40}})));
  UserInteraction.Inputs.Slider slider5(min=0, max=180) annotation (Placement(transformation(extent={{20,-60},{60,-20}})));
  Arduino.Firmata.Servo servo(digitalPin=3) annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Arduino.Firmata.Servo servo1(digitalPin=5) annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Arduino.Firmata.Servo servo2(digitalPin=6) annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Arduino.Firmata.Servo servo3(digitalPin=9) annotation (Placement(transformation(extent={{120,70},{140,90}})));
  Arduino.Firmata.Servo servo4(digitalPin=10) annotation (Placement(transformation(extent={{120,10},{140,30}})));
  Arduino.Firmata.Servo servo5(digitalPin=11) annotation (Placement(transformation(extent={{120,-50},{140,-30}})));
  Arduino.Firmata.Port port(port="COM4") annotation (Placement(transformation(extent={{182,-90},{202,-70}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{86,-110},{106,-90}})));
  Arduino.Firmata.DigitalOutput digitalOutput(digitalPin=12)
    annotation (Placement(transformation(extent={{128,-110},{148,-90}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock annotation (Placement(transformation(extent={{180,60},{200,80}})));
  UserInteraction.Outputs.NumericValue numericValue(hideConnector=false)
    annotation (Placement(transformation(extent={{180,14},{200,34}})));
equation
  connect(slider.Value, Gripper.u) annotation (Line(points={{-80,80},{-62,80}}, color={0,0,127}));
  connect(Gripper.y, servo.u) annotation (Line(points={{-39,80},{-22,80}}, color={0,0,127}));
  connect(slider1.Value, WristRotation.u) annotation (Line(points={{-80,20},{-62,20}}, color={0,0,127}));
  connect(WristRotation.y, servo1.u) annotation (Line(points={{-39,20},{-22,20}}, color={0,0,127}));
  connect(slider2.Value, WristVertical.u) annotation (Line(points={{-80,-40},{-62,-40}}, color={0,0,127}));
  connect(WristVertical.y, servo2.u) annotation (Line(points={{-39,-40},{-22,-40}}, color={0,0,127}));
  connect(servo.pinConnector, port.boardConnector)
    annotation (Line(points={{8.88178e-16,80},{10,80},{10,-80},{182,-80}}, color={0,0,0}));
  connect(servo1.pinConnector, port.boardConnector)
    annotation (Line(points={{8.88178e-16,20},{10,20},{10,-80},{182,-80}}, color={0,0,0}));
  connect(servo2.pinConnector, port.boardConnector)
    annotation (Line(points={{8.88178e-16,-40},{10,-40},{10,-80},{182,-80}}, color={0,0,0}));
  connect(slider3.Value, Elbow.u) annotation (Line(points={{60,80},{78,80}}, color={0,0,127}));
  connect(Elbow.y, servo3.u) annotation (Line(points={{101,80},{118,80}}, color={0,0,127}));
  connect(slider4.Value, Shoulder.u) annotation (Line(points={{60,20},{78,20}}, color={0,0,127}));
  connect(Shoulder.y, servo4.u) annotation (Line(points={{101,20},{118,20}}, color={0,0,127}));
  connect(slider5.Value, Base.u) annotation (Line(points={{60,-40},{78,-40}}, color={0,0,127}));
  connect(Base.y, servo5.u) annotation (Line(points={{101,-40},{118,-40}}, color={0,0,127}));
  connect(servo3.pinConnector, port.boardConnector)
    annotation (Line(points={{140,80},{160,80},{160,-80},{182,-80}}, color={0,0,0}));
  connect(servo4.pinConnector, port.boardConnector)
    annotation (Line(points={{140,20},{160,20},{160,-80},{182,-80}}, color={0,0,0}));
  connect(servo5.pinConnector, port.boardConnector)
    annotation (Line(points={{140,-40},{160,-40},{160,-80},{182,-80}}, color={0,0,0}));
  connect(booleanConstant.y, digitalOutput.value) annotation (Line(points={{107,-100},{126,-100}}, color={255,0,255}));
  connect(digitalOutput.pinConnector, port.boardConnector)
    annotation (Line(points={{148,-100},{160,-100},{160,-80},{182,-80}}, color={0,0,0}));
  connect(continuousClock.y, numericValue.Value)
    annotation (Line(points={{201,70},{208,70},{208,40},{172,40},{172,24},{179,24}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{220,120}})), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-120,-120},{220,120}})));
end AllControl;
