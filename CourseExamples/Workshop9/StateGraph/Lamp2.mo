within CourseExamples.Workshop9.StateGraph;
model Lamp2
  Modelica_StateGraph2.Step switchIsOn(
    initialStep=false,
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{30,-18},{38,-10}})));
  Modelica_StateGraph2.Step switchIsOff(
    use_activePort=false,
    nIn=2,
    nOut=1,
    initialStep=false)
  annotation (Placement(transformation(extent={{30,22},{38,30}})));
  Modelica_StateGraph2.Transition switchOff(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={66,16})));
  Modelica_StateGraph2.LoopBreakingTransition switchOn(use_conditionPort=true,
      waitTime=0.1)
    annotation (Placement(transformation(extent={{30,0},{38,8}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing1
    annotation (Placement(transformation(extent={{-16,46},{-8,54}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton(label=
        "light switch")
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ShowValue showValue
    annotation (Placement(transformation(extent={{78,-24},{98,-4}})));
  Modelica_StateGraph2.Parallel PowerAvailable(
    initialStep=true,
    use_inPort=false,
    use_outPort=false,
    use_suspend=true,
    use_activePort=false,
    nEntry=1,
    nSuspend=1,
    nResume=1) annotation (Placement(transformation(extent={{12,-58},{90,64}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton1(label=
        "plug")
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing2
    annotation (Placement(transformation(extent={{-52,-14},{-44,-6}})));
  Modelica_StateGraph2.Step unpluged(nIn=1, nOut=1)
    annotation (Placement(transformation(extent={{-24,6},{-16,14}})));
  Modelica_StateGraph2.Transition unplug(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-24,24},{-16,32}})));
  Modelica_StateGraph2.LoopBreakingTransition plug(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-24,-16},{-16,-8}})));
equation
  connect(toggleButton.y, changing1.u)
    annotation (Line(points={{-40,50},{-17.2,50}}, color={255,0,255}));
  connect(changing1.y, switchOn.conditionPort) annotation (Line(points={{-7.2,
          50},{20,50},{20,6},{29,6}}, color={255,0,255}));
  connect(switchIsOff.outPort[1], switchOn.inPort)
    annotation (Line(points={{34,21.4},{34,8}}, color={0,0,0}));
  connect(switchOn.outPort, switchIsOn.inPort[1])
    annotation (Line(points={{34,-1.8},{34,-10}}, color={0,0,0}));
  connect(switchOff.inPort, switchIsOn.outPort[1]) annotation (Line(points={{66,
          12},{66,-24},{34,-24},{34,-18.6}}, color={0,0,0}));
  connect(switchOff.outPort, switchIsOff.inPort[1])
    annotation (Line(points={{66,21},{66,36},{33,36},{33,30}}, color={0,0,0}));
  connect(switchOff.conditionPort, switchOn.conditionPort) annotation (Line(
        points={{71,16},{22,16},{22,6},{29,6}}, color={255,0,255}));
  connect(switchIsOn.activePort, showValue.activePort)
    annotation (Line(points={{38.72,-14},{76.5,-14}}, color={255,0,255}));
  connect(PowerAvailable.entry[1], switchIsOff.inPort[2]) annotation (Line(
        points={{51,57.9},{51,43.95},{35,43.95},{35,30}}, color={0,0,0}));
  connect(toggleButton1.y, changing2.u)
    annotation (Line(points={{-60,-10},{-53.2,-10}}, color={255,0,255}));
  connect(changing2.y, plug.conditionPort)
    annotation (Line(points={{-43.2,-10},{-25,-10}}, color={255,0,255}));
  connect(unplug.outPort, unpluged.inPort[1])
    annotation (Line(points={{-20,23},{-20,14}}, color={0,0,0}));
  connect(unpluged.outPort[1], plug.inPort)
    annotation (Line(points={{-20,5.4},{-20,-8}}, color={0,0,0}));
  connect(unplug.conditionPort, plug.conditionPort) annotation (Line(points={{
          -25,28},{-34,28},{-34,-10},{-25,-10}}, color={255,0,255}));
  connect(PowerAvailable.suspend[1], unplug.inPort) annotation (Line(points={{
          10.05,37.3125},{-20,37.3125},{-20,32}}, color={0,0,0}));
  connect(plug.outPort, PowerAvailable.resume[1]) annotation (Line(points={{-20,
          -17.8},{-20,-31.3125},{12,-31.3125}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end Lamp2;
