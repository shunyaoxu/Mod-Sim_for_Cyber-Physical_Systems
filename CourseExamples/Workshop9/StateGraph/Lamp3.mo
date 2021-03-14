within CourseExamples.Workshop9.StateGraph;
model Lamp3
  Modelica_StateGraph2.Step switchIsOn(
    initialStep=false,
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{20,4},{28,12}})));
  Modelica_StateGraph2.Step switchIsOff(
    use_activePort=false,
    nIn=2,
    nOut=1,
    initialStep=false)
  annotation (Placement(transformation(extent={{20,44},{28,52}})));
  Modelica_StateGraph2.Transition switchOff(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={56,38})));
  Modelica_StateGraph2.LoopBreakingTransition switchOn(use_conditionPort=true,
      waitTime=0.1)
    annotation (Placement(transformation(extent={{20,22},{28,30}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing1
    annotation (Placement(transformation(extent={{-26,68},{-18,76}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton(label=
        "light switch")
    annotation (Placement(transformation(extent={{-70,62},{-50,82}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ShowValue showValue
    annotation (Placement(transformation(extent={{144,-4},{164,16}})));
  Modelica_StateGraph2.Parallel PowerAvailable(
    initialStep=true,
    use_inPort=false,
    use_outPort=false,
    use_suspend=true,
    use_activePort=false,
    nEntry=1,
    nSuspend=1,
    nResume=1) annotation (Placement(transformation(extent={{2,-36},{80,86}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton1(label=
        "plug/unplug")
    annotation (Placement(transformation(extent={{-90,2},{-70,22}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing2
    annotation (Placement(transformation(extent={{-62,8},{-54,16}})));
  Modelica_StateGraph2.Step unpluged(nIn=1, nOut=1)
    annotation (Placement(transformation(extent={{-34,28},{-26,36}})));
  Modelica_StateGraph2.Transition unplug(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-34,46},{-26,54}})));
  Modelica_StateGraph2.LoopBreakingTransition plug(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-34,6},{-26,14}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton2(label=
        "replace")
    annotation (Placement(transformation(extent={{-80,-86},{-60,-66}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton toggleButton4(label=
        "break") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-76})));
  Modelica_StateGraph2.Blocks.MathBoolean.And lit(nu=2)
    annotation (Placement(transformation(extent={{102,0},{114,12}})));
  Modelica_StateGraph2.Step bulbIsBroken(nOut=1, nIn=1)
    annotation (Placement(transformation(extent={{22,-60},{30,-52}})));
  Modelica_StateGraph2.Step bulbIsWorking(
    initialStep=true,
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{22,-104},{30,-96}})));
  Modelica_StateGraph2.Transition breakBulb(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={66,-76})));
  Modelica_StateGraph2.LoopBreakingTransition replaceBulb(use_conditionPort=
        true, waitTime=0.1)
    annotation (Placement(transformation(extent={{22,-82},{30,-74}})));
equation
  connect(toggleButton.y, changing1.u)
    annotation (Line(points={{-50,72},{-27.2,72}}, color={255,0,255}));
  connect(changing1.y, switchOn.conditionPort) annotation (Line(points={{-17.2,
          72},{10,72},{10,28},{19,28}},
                                      color={255,0,255}));
  connect(switchIsOff.outPort[1], switchOn.inPort)
    annotation (Line(points={{24,43.4},{24,30}},color={0,0,0}));
  connect(switchOn.outPort, switchIsOn.inPort[1])
    annotation (Line(points={{24,20.2},{24,12}},  color={0,0,0}));
  connect(switchOff.inPort, switchIsOn.outPort[1]) annotation (Line(points={{56,34},
          {56,-2},{24,-2},{24,3.4}},         color={0,0,0}));
  connect(switchOff.outPort, switchIsOff.inPort[1])
    annotation (Line(points={{56,43},{56,58},{23,58},{23,52}}, color={0,0,0}));
  connect(switchOff.conditionPort, switchOn.conditionPort) annotation (Line(
        points={{61,38},{12,38},{12,28},{19,28}},
                                                color={255,0,255}));
  connect(PowerAvailable.entry[1], switchIsOff.inPort[2]) annotation (Line(
        points={{41,79.9},{41,65.95},{25,65.95},{25,52}}, color={0,0,0}));
  connect(toggleButton1.y, changing2.u)
    annotation (Line(points={{-70,12},{-63.2,12}},   color={255,0,255}));
  connect(changing2.y, plug.conditionPort)
    annotation (Line(points={{-53.2,12},{-35,12}},   color={255,0,255}));
  connect(unplug.outPort, unpluged.inPort[1])
    annotation (Line(points={{-30,45},{-30,36}}, color={0,0,0}));
  connect(unpluged.outPort[1], plug.inPort)
    annotation (Line(points={{-30,27.4},{-30,14}},color={0,0,0}));
  connect(unplug.conditionPort, plug.conditionPort) annotation (Line(points={{-35,50},
          {-44,50},{-44,12},{-35,12}},           color={255,0,255}));
  connect(PowerAvailable.suspend[1], unplug.inPort) annotation (Line(points={{
          0.05,59.3125},{-30,59.3125},{-30,54}}, color={0,0,0}));
  connect(plug.outPort, PowerAvailable.resume[1]) annotation (Line(points={{-30,
          4.2},{-30,-9.3125},{2,-9.3125}}, color={0,0,0}));
  connect(switchIsOn.activePort, lit.u[1]) annotation (Line(points={{28.72,8},{
          66,8},{66,8.1},{102,8.1}}, color={255,0,255}));
  connect(lit.y, showValue.activePort)
    annotation (Line(points={{115.2,6},{142.5,6}}, color={255,0,255}));
  connect(bulbIsBroken.outPort[1], replaceBulb.inPort)
    annotation (Line(points={{26,-60.6},{26,-74}}, color={0,0,0}));
  connect(replaceBulb.outPort, bulbIsWorking.inPort[1])
    annotation (Line(points={{26,-83.8},{26,-96}}, color={0,0,0}));
  connect(toggleButton2.y, replaceBulb.conditionPort)
    annotation (Line(points={{-60,-76},{21,-76}}, color={255,0,255}));
  connect(breakBulb.conditionPort, toggleButton4.y)
    annotation (Line(points={{71,-76},{120,-76}}, color={255,0,255}));
  connect(bulbIsBroken.inPort[1], breakBulb.outPort) annotation (Line(points={{
          26,-52},{26,-40},{66,-40},{66,-71}}, color={0,0,0}));
  connect(bulbIsWorking.outPort[1], breakBulb.inPort) annotation (Line(points={
          {26,-104.6},{26,-108},{66,-108},{66,-80}}, color={0,0,0}));
  connect(bulbIsWorking.activePort, lit.u[2]) annotation (Line(points={{30.72,
          -100},{92,-100},{92,3.9},{102,3.9}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-140},{160,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-140},{
            160,140}})),
    experiment(
      StopTime=100,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end Lamp3;
