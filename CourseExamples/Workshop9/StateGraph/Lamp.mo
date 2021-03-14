within CourseExamples.Workshop9.StateGraph;
model Lamp
  Modelica_StateGraph2.Step switchIsOn(
    initialStep=false,
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{-16,-24},{-8,-16}})));
  Modelica_StateGraph2.Step switchIsOff(
    use_activePort=false,
    nIn=1,
    nOut=1,
    initialStep=true)
  annotation (Placement(transformation(extent={{-16,16},{-8,24}})));
  Modelica_StateGraph2.Transition switchOff(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={20,10})));
  Modelica_StateGraph2.LoopBreakingTransition switchOn(use_conditionPort=true,
      waitTime=0.1)
    annotation (Placement(transformation(extent={{-16,-6},{-8,2}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing1
    annotation (Placement(transformation(extent={{-42,-4},{-34,4}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton(label=
        "light switch")
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ShowValue showValue
    annotation (Placement(transformation(extent={{32,-30},{52,-10}})));
equation
  connect(toggleButton.y, changing1.u)
    annotation (Line(points={{-56,0},{-43.2,0}}, color={255,0,255}));
  connect(changing1.y, switchOn.conditionPort)
    annotation (Line(points={{-33.2,0},{-17,0}}, color={255,0,255}));
  connect(switchIsOff.outPort[1], switchOn.inPort)
    annotation (Line(points={{-12,15.4},{-12,2}}, color={0,0,0}));
  connect(switchOn.outPort, switchIsOn.inPort[1])
    annotation (Line(points={{-12,-7.8},{-12,-16}}, color={0,0,0}));
  connect(switchOff.inPort, switchIsOn.outPort[1]) annotation (Line(points={{20,
          6},{20,-30},{-12,-30},{-12,-24.6}}, color={0,0,0}));
  connect(switchOff.outPort, switchIsOff.inPort[1]) annotation (Line(points={{
          20,15},{20,30},{-12,30},{-12,24}}, color={0,0,0}));
  connect(switchOff.conditionPort, switchOn.conditionPort) annotation (Line(
        points={{25,10},{-24,10},{-24,0},{-17,0}}, color={255,0,255}));
  connect(switchIsOn.activePort, showValue.activePort)
    annotation (Line(points={{-7.28,-20},{30.5,-20}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      Interval=0.0001,
      __Dymola_Algorithm="Dassl"));
end Lamp;
